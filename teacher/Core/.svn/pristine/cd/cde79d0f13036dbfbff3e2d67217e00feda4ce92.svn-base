//
//  CPOperationPetResDownload.m
//  iCouple
//
//  Created by yl s on 12-5-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPOperationPetResDownloadResult.h"

#import "CPUIModelPetConst.h"
#import "CPSystemEngine.h"
#import "CPLGModelAccount.h"
#import "CPDBManagement.h"
#import "CPPetManager.h"
#import "CPUIModelPetElemInfo.h"

#import "ZipArchive.h"

//: acc/pet/action
//: acc/pet/feeling
//: acc/pet/magic
//: acc/pet/smallanim

@interface CPOperationPetResDownloadResult (/*Private API*/)
{
    __strong NSNumber *resultCode;
    __strong NSString *resourceID;
    __strong NSObject *contextObj;
}

@end

@implementation CPOperationPetResDownloadResult

- (id) initWithRes:(NSString *)resID
{
    self = [super init];
    if (self)
    {
         resourceID = resID;
    }
    
    return self;
}

//deprecated.
- (id)initWithRes:(NSString *)resID andContextObj:(NSObject *)ctxObj
{
    self = [super init];
    if (self)
    {
        resourceID = resID;
        contextObj = ctxObj;
    }
    
    return self;
}

- (id)initWithResultCode:(NSNumber *)resCode andRes:(NSString *)resID andContextObj:(NSObject *)ctxObj
{
    self = [super init];
    if (self)
    {
        resultCode = resCode;
        resourceID = resID;
        contextObj = ctxObj;
    }
    
    return self;
}

-(void)main
{
    @autoreleasepool 
    {
        NSInteger type = -1;
        
        if( [contextObj isKindOfClass:[NSString class]] )
        {
            type = K_PETRES_DOWNLOAD_TYPE_PETCFG;
        }
        else if( [contextObj isKindOfClass:[CPUIModelPetElemInfo class]] )
        {
            type = K_PETRES_DOWNLOAD_TYPE_PETRES;
        }
        else
        {
            CPLogError(@"invalid context\n");
            return;
        }
        
        switch( type )
        {
            case K_PETRES_DOWNLOAD_TYPE_PETCFG:
                {
#if 0
                    NSString *petID = [dict objectForKey:@"petID"];
                    NSString *localPath = [dict objectForKey:@"localPath"];
                    
                    CPDBModelPetInfo* petInfo = [[CPDBModelPetInfo alloc] init];
                    petInfo.petID = petID;
                    petInfo.isDefault = [NSNumber numberWithBool:NO];
                    petInfo.localPath = localPath;
                    petInfo.remoteURL = [NSString stringWithFormat:@"/static/%@.cfg", petID];
                    
                    //数据持久化
                    //刷新缓存
                    [[[CPSystemEngine sharedInstance] dbManagement] insertPetInfo:petInfo];
                    
                    //更新pet信息
                    [[[CPSystemEngine sharedInstance] petManager] addNewPetInfo:petInfo];
                    
                    //启动资源数据下载，批量。
                    [[[CPSystemEngine sharedInstance] petManager] downloadPetAllRes:petID];
#endif
                    
                    if( 0 == [resultCode intValue] )
                    {
                        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                        NSString *accName = [[[CPSystemEngine sharedInstance] accountModel] loginName];
                        NSString *accDir = [docDir stringByAppendingPathComponent:accName];
                        NSString *petDir = [accDir stringByAppendingPathComponent:@"pet"];
                        NSString *tempDir = [accDir stringByAppendingPathComponent:@"pet/temp/"];
                        NSString *localFile = [NSString stringWithFormat:@"%@/%@.cfg", tempDir, resourceID];
                        CPLogInfo(@"localFile:%@\n", localFile);
                        
                        NSString *dstFile = [NSString stringWithFormat:@"%@/%@.cfg", petDir, resourceID];
                        CPLogInfo(@"dstFile:%@\n", dstFile);
                        
                        NSError *error;
                        NSFileManager *fm = [NSFileManager defaultManager];
                        [fm moveItemAtPath:localFile toPath:dstFile error:&error];
                        if(error)
                        {
                            CPLogError(@"move file error!\n");
                            //TODO:
                            return;
                        }
                        
                        CPDBModelPetInfo* petInfo = [[CPDBModelPetInfo alloc] init];
                        petInfo.petID = resourceID;
                        petInfo.isDefault = [NSNumber numberWithBool:NO];
                        petInfo.localPath = petDir;
                        petInfo.remoteURL = [NSString stringWithFormat:@"/static/%@.cfg", resourceID];
                        
                        //数据持久化
                        //刷新缓存
                        [[[CPSystemEngine sharedInstance] dbManagement] insertPetInfo:petInfo];
                        
                        //更新pet信息
                        [[[CPSystemEngine sharedInstance] petManager] addNewPetInfo:petInfo];
                        
                        //启动资源数据下载，批量。
                        [[[CPSystemEngine sharedInstance] petManager] downloadPetAllRes:resourceID];
                    }
                    else
                    {
                        ;
                    }
                }
                break;
                
            case K_PETRES_DOWNLOAD_TYPE_PETRES:
                {
                    CPUIModelPetElemInfo* elemInfo = (CPUIModelPetElemInfo *)contextObj;
                    NSInteger resType = [elemInfo.elemType intValue];
                    
                    BOOL opFlag = NO;
                    
                    if( 0 == [resultCode intValue] )
                    {
                        NSError *error;
                        NSFileManager *fm = [NSFileManager defaultManager];
                        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                        NSString *accName = [[[CPSystemEngine sharedInstance] accountModel] loginName];
                        NSString *accDir = [docDir stringByAppendingPathComponent:accName];
                        
                        NSString *dstDir = nil;
                        NSString *dstPath = nil;
                        switch( resType )
                        {
                            case K_PET_DATA_TYPE_ACTION:
                            {
                                dstDir = [accDir stringByAppendingPathComponent:@"pet/action/"];
                            }
                                break;
                                
                            case K_PET_DATA_TYPE_FEELING:
                            {
                                dstDir = [accDir stringByAppendingPathComponent:@"pet/feeling/"];
                            }
                                break;
                                
                            case K_PET_DATA_TYPE_MAGIC:
                            {
                                dstDir = [accDir stringByAppendingPathComponent:@"pet/magic/"];
                            }
                                break;
                                
                            case K_PET_DATA_TYPE_SMALLANIM:
                            {
                                dstDir = [accDir stringByAppendingPathComponent:@"pet/smallanim/"];
                            }
                                break;
                                
                            default:
                                break;
                        }
                        
                        NSString *tempDir = [accDir stringByAppendingPathComponent:@"pet/temp/"];
                        NSString *zipFile = [NSString stringWithFormat:@"%@/%@.zip", tempDir, elemInfo.elemID];
                        
                        dstPath = [NSString stringWithFormat:@"%@/%@", dstDir, resourceID];
                        
                        BOOL isDir = NO;
                        BOOL dirExist = NO;
                        dirExist = [fm fileExistsAtPath:dstPath isDirectory:&isDir];
                        if( dirExist && isDir )
                        {
                            [fm removeItemAtPath:dstPath error:&error];
                        }
                        
                        //解压
                        ZipArchive* zip = [[ZipArchive alloc] init];
                        BOOL flag = [zip UnzipOpenFile:zipFile];
                        if( flag ) 
                        {  
                            BOOL ret = [zip UnzipFileTo:dstDir overWrite:YES];  
                            if( NO == ret )
                            {
                                CPLogInfo(@"Unzip Failed\n");
                                //TODO:
//                                return;
                            }
                            
                            opFlag = YES;
                            
                            [zip UnzipCloseFile];
                            
                            [fm removeItemAtPath:zipFile error:&error];
                        }
                        
                        //
                        NSArray * ary = [[[CPSystemEngine sharedInstance] dbManagement] findAllPetData];
                        CPDBModelPetData *oldData = nil;
                        for( CPDBModelPetData *data in ary )
                        {
                            if( [data.dataID isEqualToString:resourceID] && [data.petResID isEqualToString:elemInfo.elemPetResID] )
                            {
                                oldData = data;
                                break;
                            }
                        }
                        
                        CPDBModelPetData* petData = [[CPDBModelPetData alloc] init];
                        petData.dataID = resourceID;
                        petData.dataType = elemInfo.elemType;
                        if(oldData)
                        {
                            petData.category = oldData.category;
                        }
                        else
                        {
                            petData.category = elemInfo.elemCategory;//oldData.category;//category;
                        }
                        petData.isDefault = [NSNumber numberWithBool:NO];
                        if( YES == opFlag )
                        {
                            petData.isAvailable = [NSNumber numberWithInt:1];
                        }
                        else
                        {
                            petData.isAvailable = [NSNumber numberWithInt:0];
                        }
                        petData.petID = [NSNumber numberWithInt:1]; //
                        petData.petResID = elemInfo.elemPetResID;
                        petData.name = elemInfo.elemName;
                        petData.thumb = [NSString stringWithFormat:@"%@/%@_thumb@2x.gif", dstPath, resourceID];
                        petData.remoteURL = oldData.remoteURL;//remoteURL;
                        petData.localPath = dstPath;
                        //attention.
                        if( YES == opFlag )
                        {
                            petData.mark = [NSNumber numberWithInt:K_PETRES_MARK_TYPE_ClEAR];
                        }
                        
                        if( oldData )
                        {
                            [[[CPSystemEngine sharedInstance] dbManagement] updatePetDataWithID:oldData.localID obj:petData];
                        }
                        else
                        {
                            [[[CPSystemEngine sharedInstance] dbManagement] insertPetData:petData];
                        }
                        
                        if( YES == opFlag )
                        {
                            //更新宠物管理器资源缓存。
                            [[[CPSystemEngine sharedInstance] petManager] tempUpdateRes:petData];
                        }
                        
                        //移出挂起的下载项。
                        [[[CPSystemEngine sharedInstance] petManager] clearDownloadInfo:elemInfo.elemID ofPet:elemInfo.elemPetResID];
                    }
                    
                    int result = -1;
                    if( 0 == [resultCode intValue] && YES == opFlag )
                    {
                        result = 0;
                    }
                    NSMutableDictionary *xxdict = [NSMutableDictionary dictionary];
                    [xxdict setObject:[NSNumber numberWithInt:2] forKey:@"type"];       //type : PetDataChangeType
                    [xxdict setObject:[NSNumber numberWithInt:result/*[resultCode intValue]*/] forKey:@"resultCode"];
                    [xxdict setObject:elemInfo.elemType forKey:@"category"];
                    [xxdict setObject:elemInfo.elemPetResID forKey:@"petid"];
                    [xxdict setObject:elemInfo.elemID forKey:@"resid"];
                    
                    CPLogInfo(@"xxdict:%@\n", xxdict);
                    
                    [[CPSystemEngine sharedInstance] updateTagForPetDataChange:xxdict];
                }
                break;
                
            default:
                break;
        }
    }
}

@end








//1：解压。
//2：更新数据库
//3：解析描述文件
//4：生成目标对象
//5：更新缓冲区

