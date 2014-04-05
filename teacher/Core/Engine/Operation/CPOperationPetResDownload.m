//
//  CPOperationPetResDownload.m
//  iCouple
//
//  Created by yl s on 12-6-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPOperationPetResDownload.h"

#import "CPUIModelPetConst.h"
#import "CPSystemEngine.h"
#import "CPLGModelAccount.h"
#import "CPDBManagement.h"
#import "CPPetManager.h"
#import "CPUIModelPetElemInfo.h"

@interface CPOperationPetResDownload (/*Private API*/)
{
    __strong NSObject *contextObj;
    __strong NSNumber *dldtype;
}

@end

@implementation CPOperationPetResDownload

//deprecated.
- (id)initWithContextObj:(NSObject *)ctxObj
{
    self = [super init];
    if (self)
    {
        contextObj = ctxObj;
    }
    
    return self;
}

- (id)initWithObj:(NSObject *)obj andType:(NSInteger)type
{
    self = [super init];
    if (self)
    {
        contextObj = obj;
        dldtype = [NSNumber numberWithInt:type];
    }
    
    return self;
}

- (void)main
{
    @autoreleasepool 
    {
        NSInteger type = [dldtype intValue];
        
        switch( type )
        {
            case K_PETRES_DOWNLOAD_TYPE_PETCFG:
            {
#if 0
                NSString *petID = [dict objectForKey:@"petID"];
                NSString *localPath = [dict objectForKey:@"localPath"];
                NSString *dstFile = [dict objectForKey:@"dstFile"];
                NSString *remoteURL = [dict objectForKey:@"remoteURL"];

                //数据持久化
                //刷新缓存
                CPDBModelPetInfo* petInfo = [[[CPSystemEngine sharedInstance] dbManagement] getPetInfo:petID];
                if(petInfo)
                {
                    petInfo.isDefault = [NSNumber numberWithBool:NO];
                    //do not set localPath before cfg was downloaded successfully.
//                    petInfo.localPath = localPath;
                    petInfo.remoteURL = remoteURL;
                    petInfo.mark = [NSNumber numberWithInt:K_PETRES_MARK_TYPE_DOWNLOADING];
                    
                    [[[CPSystemEngine sharedInstance] dbManagement] updatePetInfoWithID:petInfo.localID obj:petInfo];
                }
                else
                {
                    petInfo = [[CPDBModelPetInfo alloc] init];
                    petInfo.petID = petID;
//                    petInfo.petName = XXX;    //we do not know it's name at this moment. it will be update later.
                    petInfo.isDefault = [NSNumber numberWithBool:NO];
                    //此时还不存在本地文件夹，需要此时就建立？？？
//                    petInfo.localPath = localPath;
                    petInfo.remoteURL = remoteURL;
                    petInfo.mark = [NSNumber numberWithInt:K_PETRES_MARK_TYPE_DOWNLOADING];
                    
                    [[[CPSystemEngine sharedInstance] dbManagement] insertPetInfo:petInfo];
                }
                
                /*
                 此时需要更新petInfo？？？
                 */
                //更新pet信息
//                [[[CPSystemEngine sharedInstance] petManager] addNewPetInfo:petInfo];
                
                //发起下载。
                [[[CPSystemEngine sharedInstance] petManager] downloadPetResOf:petID from:remoteURL foFile:dstFile andContextObj:contextObj];
#endif

                NSString *petId = (NSString *)contextObj;

                NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                NSString *accName = [[[CPSystemEngine sharedInstance] accountModel] loginName];
                NSString *accDir = [docDir stringByAppendingPathComponent:accName];
                NSString *tempDir = [accDir stringByAppendingPathComponent:@"pet/temp/"];
                NSString *dstFile = [NSString stringWithFormat:@"%@/%@.cfg", tempDir, petId];
                CPLogInfo(@"dstPath:%@\n", dstFile);
                
                NSString *remoterURL = [NSString stringWithFormat:@"/static/%@.cfg", petId];
                CPLogInfo(@"remoterURL:%@\n", remoterURL);
                
                [[[CPSystemEngine sharedInstance] petManager] downloadPetResOf:petId
                                                                          from:remoterURL
                                                                        foFile:dstFile
                                                                 andContextObj:petId];
            }
                break;
                
            case K_PETRES_DOWNLOAD_TYPE_PETRES:
            {
                if( ![contextObj isKindOfClass:[CPUIModelPetElemInfo class]] )
                {
                    break;
                }

                CPUIModelPetElemInfo *elemInfo = (CPUIModelPetElemInfo *)contextObj;
                
                NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                NSString *accName = [[[CPSystemEngine sharedInstance] accountModel] loginName];
                NSString *accDir = [docDir stringByAppendingPathComponent:accName];
                NSString *tempDir = [accDir stringByAppendingPathComponent:@"pet/temp/"];
                NSString *dstFile = [NSString stringWithFormat:@"%@/%@.zip", tempDir, elemInfo.elemID];
                CPLogInfo(@"dstFile:%@\n", dstFile);
                
                //数据持久化
                //刷新缓存
                CPDBModelPetData* petData = [[[CPSystemEngine sharedInstance] dbManagement] getPetData:elemInfo.elemID];
                if(petData)
                {
                    petData.isDefault = [NSNumber numberWithBool:NO];
                    //do not set localPath before cfg was downloaded successfully.
//                    petInfo.localPath = localPath;
                    petData.dataSize = elemInfo.elemSize;
                    petData.name = elemInfo.elemName;
//                    petData.thumb
//                    petData.localPath
                    petData.remoteURL = elemInfo.elemRemoteURL;
                    petData.mark = [NSNumber numberWithInt:K_PETRES_MARK_TYPE_DOWNLOADING];
                    
                    [[[CPSystemEngine sharedInstance] dbManagement] updatePetDataWithID:petData.localID obj:petData];
                }
                else
                {
                    petData = [[CPDBModelPetData alloc] init];
                    
                    petData.dataID = elemInfo.elemID;
                    petData.dataType = elemInfo.elemType;
                    petData.dataSize = elemInfo.elemSize;
                    petData.category = elemInfo.elemCategory;
                    petData.isDefault = [NSNumber numberWithBool:NO];
//                    petData.petID
                    petData.petResID = elemInfo.elemPetResID;
                    petData.name = elemInfo.elemName;
//                    petData.thumb
                    //此时还不存在本地文件夹，需要此时就建立？？？
//                    petData.localPath = localPath;
                    petData.remoteURL = elemInfo.elemRemoteURL;
                    petData.mark = [NSNumber numberWithInt:K_PETRES_MARK_TYPE_DOWNLOADING];
                    
                    [[[CPSystemEngine sharedInstance] dbManagement] insertPetData:petData];
                }
                
                /*
                 此时需要更新petInfo？？？
                 */
                //更新pet信息
                //                [[[CPSystemEngine sharedInstance] petManager] addNewPetInfo:petInfo];
                
                //++
                if( K_PET_DATA_TYPE_FEELING == [elemInfo.elemType intValue] )
                {
                    [[[CPSystemEngine sharedInstance] petManager] setFeelingAnimDldStatus:K_PETRES_MARK_TYPE_DOWNLOADING ofRes:elemInfo.elemID andPet:elemInfo.elemPetResID];                
                }
                else if( K_PET_DATA_TYPE_MAGIC == [elemInfo.elemType intValue] )
                {
                    [[[CPSystemEngine sharedInstance] petManager] setMagicAnimDldStatus:K_PETRES_MARK_TYPE_DOWNLOADING ofRes:elemInfo.elemID andPet:elemInfo.elemPetResID];
                }
                //--
                
                //发起下载。
                [[[CPSystemEngine sharedInstance] petManager] downloadPetResOf:elemInfo.elemID
                                                                          from:elemInfo.elemRemoteURL
                                                                        foFile:dstFile
                                                                 andContextObj:elemInfo];

                NSMutableDictionary *xxdict = [NSMutableDictionary dictionary];
                [xxdict setObject:[NSNumber numberWithInt:3] forKey:@"type"];   //type : PetDataChangeType
                [xxdict setObject:[NSNumber numberWithInt:99] forKey:@"resultCode"];
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
