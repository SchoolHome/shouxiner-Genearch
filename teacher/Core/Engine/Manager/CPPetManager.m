//
//  CPPetManager.m
//  iCouple
//
//  Created by yl s on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPPetManager.h"

#import "CPUIModelPetConst.h"
#import "CPUIModelPetInfo.h"
#import "CPUIModelPetElemInfo.h"

#import "CPSystemEngine.h"
#import "CPDBManagement.h"
#import "CPLGModelAccount.h"

#import "CPDBModelPetInfo.h"
#import "CPDBModelPetData.h"

#import "CPHttpEngine.h"

#define FK_PET_FTR

@interface PetDldInfo : NSObject

@property (strong, nonatomic) NSString *petID;
@property (strong, nonatomic) NSString *localPath;

@end

@implementation PetDldInfo

@synthesize petID = _petID;
@synthesize localPath = _localPath;

@end

@interface PetResDldInfo : NSObject

@property (strong, nonatomic) NSString *resID;
@property (strong, nonatomic) NSString *localPath;

@end

@implementation PetResDldInfo

@synthesize resID = _resID;
@synthesize localPath = _localPath;

@end

#define K_DEFAULT_PET_ID                        @"pet_default"

#define K_PET_DATA_CATEGORY_ACTION              @"action"
#define K_PET_DATA_CATEGORY_FEELING             @"feeling"
#define K_PET_DATA_CATEGORY_MAGIC               @"magic"
#define K_PET_DATA_CATEGORY_SMALLANIM           @"smallanim"

//---------------------------------------------------------------------------------------------------
//interface
//---------------------------------------------------------------------------------------------------

@interface CPPetManager (/*Private Methods*/)
{
    NSMutableDictionary *_petInfoDict;      //......
    NSMutableDictionary *_petDataDict;      //......
    
    NSMutableDictionary *_smallAnimDict;
    
    NSNumber *_initialized;
    
#ifdef FK_PET_FTR
    NSMutableDictionary *_pendingResOpDict;
    NSMutableDictionary *_tempPedingResDldRCDDict;
#endif
}

@property (strong, nonatomic) NSMutableDictionary *petInfoDict;         //......
@property (strong, nonatomic) NSMutableDictionary *petDataDict;         //......

@property (strong, nonatomic) NSMutableDictionary *smallAnimEscpDict;

@property (strong, nonatomic) NSNumber *initialized;

#ifdef FK_PET_FTR
@property (strong, nonatomic) NSMutableDictionary *pendingResOpDict;
#endif

@end

//---------------------------------------------------------------------------------------------------
//implementation
//---------------------------------------------------------------------------------------------------
@implementation CPPetManager

@synthesize petInfoDict = _petInfoDict;         //......
@synthesize petDataDict = _petDataDict;         //......

@synthesize smallAnimEscpDict = _smallAnimEscpDict;

@synthesize initialized = _initialized;

#ifdef FK_PET_FTR
@synthesize pendingResOpDict = _pendingResOpDict;
#endif

- (id)init
{
	if ((self = [super init]))
	{
        CPLogInfo(@"\n");
        
        self.initialized = [NSNumber numberWithBool:NO];
        
        self.petInfoDict = [NSMutableDictionary dictionary];            //......
        self.petDataDict = [NSMutableDictionary dictionary];
        
        self.smallAnimEscpDict = [NSMutableDictionary dictionary];

        NSMutableDictionary *dataDict = [NSMutableDictionary dictionary];
        NSMutableDictionary *fDict = [NSMutableDictionary dictionary];
        [fDict setObject:[NSMutableDictionary dictionary] forKey:PET_FEELING_TYPE_LOVE];
        [fDict setObject:[NSMutableDictionary dictionary] forKey:PET_FEELING_TYPE_HAPPY];
        [fDict setObject:[NSMutableDictionary dictionary] forKey:PET_FEELING_TYPE_SAD];
        [dataDict setObject:fDict forKey:K_PET_DATA_CATEGORY_FEELING];
        [dataDict setObject:[NSMutableDictionary dictionary] forKey:K_PET_DATA_CATEGORY_ACTION];
        [dataDict setObject:[NSMutableDictionary dictionary] forKey:K_PET_DATA_CATEGORY_MAGIC];
        [dataDict setObject:[NSMutableDictionary dictionary] forKey:K_PET_DATA_CATEGORY_SMALLANIM];
        [self.petDataDict setObject:dataDict forKey:K_DEFAULT_PET_ID];
        
#ifdef  FK_PET_FTR
        self.pendingResOpDict = [NSMutableDictionary dictionary];
        NSMutableArray *ary = [[NSMutableArray alloc] init];
        [self.pendingResOpDict setObject:ary forKey:@"pet_default"];
        
        _tempPedingResDldRCDDict = [NSMutableDictionary dictionary];
#endif
	}
    
	return self;
}

- (void)clearCache
{
    CPLogInfo(@"\n");
    
    self.initialized = nil;
    self.initialized = [NSNumber numberWithBool:NO];
    
    self.petInfoDict = nil;
    self.petInfoDict = [NSMutableDictionary dictionary];            //......
    self.petDataDict = nil;
    self.petDataDict = [NSMutableDictionary dictionary];
    
    self.smallAnimEscpDict = nil;
    self.smallAnimEscpDict = [NSMutableDictionary dictionary];
    
    NSMutableDictionary *dataDict = [NSMutableDictionary dictionary];
    NSMutableDictionary *fDict = [NSMutableDictionary dictionary];
    [fDict setObject:[NSMutableDictionary dictionary] forKey:PET_FEELING_TYPE_LOVE];
    [fDict setObject:[NSMutableDictionary dictionary] forKey:PET_FEELING_TYPE_HAPPY];
    [fDict setObject:[NSMutableDictionary dictionary] forKey:PET_FEELING_TYPE_SAD];
    [dataDict setObject:fDict forKey:K_PET_DATA_CATEGORY_FEELING];
    [dataDict setObject:[NSMutableDictionary dictionary] forKey:K_PET_DATA_CATEGORY_ACTION];
    [dataDict setObject:[NSMutableDictionary dictionary] forKey:K_PET_DATA_CATEGORY_MAGIC];
    [dataDict setObject:[NSMutableDictionary dictionary] forKey:K_PET_DATA_CATEGORY_SMALLANIM];
    [self.petDataDict setObject:dataDict forKey:K_DEFAULT_PET_ID];
    
#ifdef  FK_PET_FTR
    self.pendingResOpDict = nil;
    self.pendingResOpDict = [NSMutableDictionary dictionary];
    NSMutableArray *ary = [[NSMutableArray alloc] init];
    [self.pendingResOpDict setObject:ary forKey:@"pet_default"];
    
    _tempPedingResDldRCDDict = nil;
    _tempPedingResDldRCDDict = [NSMutableDictionary dictionary];
#endif
}

- (CPUIModelPetFeelingAnim *)getFeelingObject:(NSString *)resID ofPet:(NSString *)petID
{
    CPUIModelPetFeelingAnim *dstObj = nil;
    
    if( nil == [self.petInfoDict objectForKey:petID] )
    {
        return dstObj;
    }
    
    NSDictionary *feelingDict = [[self.petDataDict objectForKey:petID] objectForKey:K_PET_DATA_CATEGORY_FEELING];
    if( feelingDict && [feelingDict count] )
    {
        NSDictionary *loveFeelingDict = [feelingDict objectForKey:PET_FEELING_TYPE_LOVE];
        NSDictionary *happyFeelingDict = [feelingDict objectForKey:PET_FEELING_TYPE_HAPPY];
        NSDictionary *sadFeelingDict = [feelingDict objectForKey:PET_FEELING_TYPE_SAD];
        
        dstObj = [loveFeelingDict objectForKey:resID];
        if( !dstObj )
        {
            dstObj = [happyFeelingDict objectForKey:resID];
            if( !dstObj )
            {
                dstObj = [sadFeelingDict objectForKey:resID];
            }
        }
    }
    
    return dstObj;
}

- (void)loadPetInfo:(NSArray *)petInfoArray
{
    for( CPDBModelPetInfo *petInfo in petInfoArray )
    {
        CPUIModelPetInfo *pInfo = [CPUIModelPetInfo initFromProto:petInfo];
        if( petInfo )
        {
            [self.petInfoDict setObject:pInfo forKey:pInfo.petID];
        }
        else
        {
            CPLogError(@"invalid petinfo\n");
        }
    }
}

- (void)loadPetData:(NSArray *)petDataArray
{
    for( CPDBModelPetData *petData in petDataArray )
    {
        NSString *petResID = petData.petResID;
        
        NSInteger dataType = [petData.dataType intValue];
        //+++++++++++++++++++++++++++++++++++++++++++++++++++
        if( K_PETRES_MARK_TYPE_DOWNLOADING == [petData.mark intValue] )
        {
            if( [_tempPedingResDldRCDDict objectForKey:petData.petResID] )
            {
                if( ![[_tempPedingResDldRCDDict objectForKey:petData.petResID] containsObject:petData.dataID] )
                {
                    [[_tempPedingResDldRCDDict objectForKey:petData.petResID] addObject:petData.dataID];
                }
            }
            else
            {
                NSMutableArray *resArray = [[NSMutableArray alloc] init];
                [resArray addObject:petData.dataID];
                [_tempPedingResDldRCDDict setObject:resArray forKey:petData.petResID];
            }
        }
        //---------------------------------------------------
        
        switch (dataType)
        {
            case K_PET_DATA_TYPE_ACTION:
                {
                    CPUIModelPetActionAnim *actionAnim = [CPUIModelPetActionAnim initFromProto:petData];

                    if(actionAnim)
                    {
                        NSMutableDictionary *dataDict = [self.petDataDict objectForKey:petResID];
                        if( !dataDict )
                        {
                            dataDict = [NSMutableDictionary dictionary];
                            [dataDict setObject:[NSMutableDictionary dictionary] forKey:K_PET_DATA_CATEGORY_ACTION];
                            [self.petDataDict setObject:dataDict forKey:petResID];
                        }

                        NSMutableDictionary *actionDict = [dataDict objectForKey:K_PET_DATA_CATEGORY_ACTION];
                        if( !actionDict )
                        {
                            actionDict = [NSMutableDictionary dictionary];
                            [dataDict setObject:actionDict forKey:K_PET_DATA_CATEGORY_ACTION];
                        }
                        
                        [actionDict setObject:actionAnim forKey:actionAnim.resourceID];
                    }
                }
                break;
                
            case K_PET_DATA_TYPE_FEELING:
                {
                    CPUIModelPetFeelingAnim *feelingAnim = [CPUIModelPetFeelingAnim initFromProto:petData];
                
                    if(feelingAnim)
                    {
                        NSMutableDictionary *dataDict = [self.petDataDict objectForKey:petResID];
                        if( !dataDict )
                        {
                            dataDict = [NSMutableDictionary dictionary];
                            [dataDict setObject:[NSMutableDictionary dictionary] forKey:K_PET_DATA_CATEGORY_FEELING];
                            [self.petDataDict setObject:dataDict forKey:petResID];
                        }
                        
                        NSMutableDictionary *feelingDict = [dataDict objectForKey:K_PET_DATA_CATEGORY_FEELING];
                        if( !feelingDict )
                        {
                            feelingDict = [NSMutableDictionary dictionary];
                            [dataDict setObject:feelingDict forKey:K_PET_DATA_CATEGORY_FEELING];
                        }
                    
                        switch(feelingAnim.category)
                        {
                            case FeelingCategoryLove:
                                {
                                    NSMutableDictionary *loveFeelingDict = [feelingDict objectForKey:PET_FEELING_TYPE_LOVE];
                                    if( !loveFeelingDict )
                                    {
                                        loveFeelingDict = [NSMutableDictionary dictionary];
                                        [feelingDict setObject:loveFeelingDict forKey:PET_FEELING_TYPE_LOVE];
                                    }
                                    
                                    [loveFeelingDict setObject:feelingAnim forKey:feelingAnim.resourceID];
                                    CPLogInfo(@"hhhhhhhhhhhhh  %@",loveFeelingDict);
                                }
                                break;
                            
                            case FeelingCategoryhappy:
                                {
                                    NSMutableDictionary *happyFeelingDict = [feelingDict objectForKey:PET_FEELING_TYPE_HAPPY];
                                    if( !happyFeelingDict )
                                    {
                                        happyFeelingDict = [NSMutableDictionary dictionary];
                                        [feelingDict setObject:happyFeelingDict forKey:PET_FEELING_TYPE_HAPPY];
                                    }
                                    
                                    [happyFeelingDict setObject:feelingAnim forKey:feelingAnim.resourceID];
                                }
                                break;
                            
                            case FeelingCategorySad:
                                {
                                    NSMutableDictionary *sadFeelingDict = [feelingDict objectForKey:PET_FEELING_TYPE_SAD];
                                    if( !sadFeelingDict )
                                    {
                                        sadFeelingDict = [NSMutableDictionary dictionary];
                                        [feelingDict setObject:sadFeelingDict forKey:PET_FEELING_TYPE_SAD];
                                    }
                                    
                                    [sadFeelingDict setObject:feelingAnim forKey:feelingAnim.resourceID];
                                }
                                break;
                            
                            case FeelingCategoryUnknown:
                                {
                                    //.
                                    CPLogError(@"unknown feeling\n");
                                }
                                break;
                            
                            default:
                                break;
                        }
                    }
                }
                break;
                
            case K_PET_DATA_TYPE_MAGIC:
                {
                    CPUIModelPetMagicAnim *magicAnim = [CPUIModelPetMagicAnim initFromProto:petData];
                
                    if(magicAnim)
                    {
                        NSMutableDictionary *dataDict = [self.petDataDict objectForKey:petResID];
                        if( !dataDict )
                        {
                            dataDict = [NSMutableDictionary dictionary];
                            [dataDict setObject:[NSMutableDictionary dictionary] forKey:K_PET_DATA_CATEGORY_MAGIC];
                            [self.petDataDict setObject:dataDict forKey:petResID];
                        }

                        NSMutableDictionary *magicDict = [dataDict objectForKey:K_PET_DATA_CATEGORY_MAGIC];
                        if( !magicDict )
                        {
                            magicDict = [NSMutableDictionary dictionary];
                            [dataDict setObject:magicDict forKey:K_PET_DATA_CATEGORY_MAGIC];
                        }
                        
                        [magicDict setObject:magicAnim forKey:magicAnim.resourceID];
                    }
                }
                break;
                
            case K_PET_DATA_TYPE_SMALLANIM:
                {
                    CPUIModelPetSmallAnim *smallAnim = [CPUIModelPetSmallAnim initFromProto:petData];
                    if(smallAnim)
                    {
                        NSMutableDictionary *dataDict = [self.petDataDict objectForKey:petResID];
                        if( !dataDict )
                        {
                            dataDict = [NSMutableDictionary dictionary];
                            [dataDict setObject:[NSMutableDictionary dictionary] forKey:K_PET_DATA_CATEGORY_SMALLANIM];
                            [self.petDataDict setObject:dataDict forKey:petResID];
                        }
                        
                        NSMutableDictionary *smallAnimDict = [dataDict objectForKey:K_PET_DATA_CATEGORY_SMALLANIM];
                        if( !smallAnimDict )
                        {
                            smallAnimDict = [NSMutableDictionary dictionary];
                            [dataDict setObject:smallAnimDict forKey:K_PET_DATA_CATEGORY_SMALLANIM];
                        }
                        
                        [smallAnimDict setObject:smallAnim forKey:smallAnim.resourceID];
                        
                        //++++++++++++++++++++++++++++
                        [self.smallAnimEscpDict setObject:smallAnim.resourceID forKey:smallAnim.escapeChar];
                        //----------------------------
                    }
                }
                break;
                
            default:
                break;
        }
    }
}

- (void)initPetData
{
    CPLogInfo(@"initialized:%@\n", self.initialized);
    
    if( [self.initialized boolValue] )
    {
        return;
    }
    
    NSArray *allPetInfo = [[[CPSystemEngine sharedInstance] dbManagement ] findAllPetInfo];
    NSArray *allPetData = [[[CPSystemEngine sharedInstance] dbManagement ] findAllPetData];
    
    CPLogInfo(@"allPetInfo:%@\n", allPetInfo);
    CPLogInfo(@"allPetData:%@\n", allPetData);
    
    if(allPetInfo && allPetData && [allPetInfo count] && [allPetData count])
    {
        self.initialized = [NSNumber numberWithBool:YES];
    }
    
    [self loadPetInfo:allPetInfo];
    
    [self loadPetData:allPetData];
    
    if( [self.initialized boolValue] )
    {
        NSMutableDictionary *xxdict = [NSMutableDictionary dictionary];
        [xxdict setObject:[NSNumber numberWithInt:5] forKey:@"type"];       //type : PetDataChangeType
        [[CPSystemEngine sharedInstance] updateTagForPetDataChange:xxdict];
    }
}

- (void)addNewPetInfo:(CPDBModelPetInfo *)petInfo
{
    CPLogInfo(@"new pet inf, pid:%@\n", petInfo.petID);
    
    @synchronized(self)
    {
        //TODO:
        CPUIModelPetInfo *pInfo = [CPUIModelPetInfo initFromProto:petInfo];
        if( petInfo )
        {
            [self.petInfoDict setObject:pInfo forKey:pInfo.petID];
        }
        else
        {
            CPLogError(@"invalid petinfo\n");
        }
    }
}

- (void)clearDownloadInfo:(NSString *)resID ofPet:(NSString *)petID
{
    @synchronized(self)
    {
        NSMutableArray *ary = [self.pendingResOpDict objectForKey:petID];
        if([ary containsObject:resID])
        {
            CPLogInfo(@"remove obj--ID_1:%@, ID_2:%@", resID, petID);
            [ary removeObject:resID];
        }
        
        if( [ary count] == 0)
        {
            [self.pendingResOpDict removeObjectForKey:petID];
        }
    }
}

- (void)tempUpdateRes:(CPDBModelPetData *)data
{
    @synchronized(self)
    {
        NSString *petResID = data.petResID;
        NSInteger type = [data.dataType intValue];
        
        switch( type )
        {
            case K_PET_DATA_TYPE_ACTION:
                {
                
                }
                break;
                
            case K_PET_DATA_TYPE_FEELING:
                {
                    CPUIModelPetFeelingAnim *feelingAnim = [CPUIModelPetFeelingAnim initFromProto:data];

                    if(feelingAnim)
                    {
                        NSMutableDictionary *dataDict = [self.petDataDict objectForKey:petResID];
                        if( !dataDict )
                        {
                            dataDict = [NSMutableDictionary dictionary];
                            [dataDict setObject:[NSMutableDictionary dictionary] forKey:K_PET_DATA_CATEGORY_FEELING];
                            [self.petDataDict setObject:dataDict forKey:petResID];
                        }
                        
                        NSMutableDictionary *feelingDict = [dataDict objectForKey:K_PET_DATA_CATEGORY_FEELING];
                        if( !feelingDict )
                        {
                            feelingDict = [NSMutableDictionary dictionary];
                            [dataDict setObject:feelingDict forKey:K_PET_DATA_CATEGORY_FEELING];
                        }

                        //////////////////////////////////////////
//                        NSMutableDictionary *feelingDict = [[self.petDataDict objectForKey:petResID] objectForKey:K_PET_DATA_CATEGORY_FEELING];
                        
                        switch([data.category intValue])
                        {
                            case K_FEELING_TYPE_LOVE:
                                {
                                    NSMutableDictionary *loveFeelingDict = [feelingDict objectForKey:PET_FEELING_TYPE_LOVE];
                                    if( !loveFeelingDict )
                                    {
                                        loveFeelingDict = [NSMutableDictionary dictionary];
                                        [feelingDict setObject:loveFeelingDict forKey:PET_FEELING_TYPE_LOVE];
                                    }
                                    
                                    [loveFeelingDict setObject:feelingAnim forKey:feelingAnim.resourceID];
                                    //////
//                                    [[feelingDict objectForKey:PET_FEELING_TYPE_LOVE] setObject:feelingAnim forKey:feelingAnim.resourceID];
                                }
                                break;
                                
                            case K_FEELING_TYPE_HAPPY:
                                {
                                    NSMutableDictionary *happyFeelingDict = [feelingDict objectForKey:PET_FEELING_TYPE_HAPPY];
                                    if( !happyFeelingDict )
                                    {
                                        happyFeelingDict = [NSMutableDictionary dictionary];
                                        [feelingDict setObject:happyFeelingDict forKey:PET_FEELING_TYPE_HAPPY];
                                    }
                                    
                                    [happyFeelingDict setObject:feelingAnim forKey:feelingAnim.resourceID];
//                                    [[feelingDict objectForKey:PET_FEELING_TYPE_HAPPY] setObject:feelingAnim forKey:feelingAnim.resourceID];
                                }
                                break;
                                
                            case K_FEELING_TYPE_SAD:
                                {
                                    NSMutableDictionary *sadFeelingDict = [feelingDict objectForKey:PET_FEELING_TYPE_SAD];
                                    if( !sadFeelingDict )
                                    {
                                        sadFeelingDict = [NSMutableDictionary dictionary];
                                        [feelingDict setObject:sadFeelingDict forKey:PET_FEELING_TYPE_SAD];
                                    }
                                    
                                    [sadFeelingDict setObject:feelingAnim forKey:feelingAnim.resourceID];
//                                    [[feelingDict objectForKey:PET_FEELING_TYPE_SAD] setObject:feelingAnim forKey:feelingAnim.resourceID];
                                }
                                break;
                                
                            default:
                                break;
                        }
                    }
                }
                break;
                
            case K_PET_DATA_TYPE_MAGIC:
                {
                    CPUIModelPetMagicAnim *magicAnim = [CPUIModelPetMagicAnim initFromProto:data];
                    
                    if(magicAnim)
                    {
                        NSMutableDictionary *dataDict = [self.petDataDict objectForKey:petResID];
                        if( !dataDict )
                        {
                            dataDict = [NSMutableDictionary dictionary];
                            [dataDict setObject:[NSMutableDictionary dictionary] forKey:K_PET_DATA_CATEGORY_MAGIC];
                            [self.petDataDict setObject:dataDict forKey:petResID];
                        }
                        
                        NSMutableDictionary *magicDict = [dataDict objectForKey:K_PET_DATA_CATEGORY_MAGIC];
                        if( !magicDict )
                        {
                            magicDict = [NSMutableDictionary dictionary];
                            [dataDict setObject:magicDict forKey:K_PET_DATA_CATEGORY_MAGIC];
                        }

//                        NSMutableDictionary *magicDict = [[self.petDataDict objectForKey:petResID] objectForKey:K_PET_DATA_CATEGORY_MAGIC];
                        [magicDict setObject:magicAnim forKey:magicAnim.resourceID];
                    }
                }
                break;
                
            case K_PET_DATA_TYPE_SMALLANIM:
                {
                
                }
                break;
                
            case K_PET_DATA_TYPE_UNKNOWN:
                {
                    CPLogError(@"invalid pet data\n");
                }
                break;
                
            default:
                break;
        }    
    }
}

- (NSArray *)allActionObjects
{
    @synchronized(self)
    {
        //.default only.
        NSMutableDictionary *actionDict = [[self.petDataDict objectForKey:K_DEFAULT_PET_ID] objectForKey:K_PET_DATA_CATEGORY_ACTION];
        
        return [actionDict allValues];
    }
}

- (CPUIModelPetActionAnim *)actionObjectOfID:(NSString *)resID
{
    @synchronized(self)
    {
        //.default only.
        NSMutableDictionary *actionDict = [[self.petDataDict objectForKey:K_DEFAULT_PET_ID] objectForKey:K_PET_DATA_CATEGORY_ACTION];
        CPUIModelPetActionAnim *actionAnim = [actionDict objectForKey:resID];
        
        return actionAnim;
    }
}

- (NSArray *)allMagicObjects
{
    @synchronized(self)
    {
        NSMutableArray *magicArray = [[NSMutableArray alloc] init];
        
        NSArray *keyArray = [self.petDataDict allKeys];
        for( NSString *key in keyArray )
        {
            NSDictionary *magicDict = [[self.petDataDict objectForKey:key] objectForKey:K_PET_DATA_CATEGORY_MAGIC];
            if( magicDict && [magicDict count] > 0 )
            {
                [magicArray addObjectsFromArray:[magicDict allValues]];
            }
        }
        
        CPLogInfo(@"magics:%@\n", magicArray);
        
        return magicArray;
    }
}

- (CPUIModelPetMagicAnim *)magicObject:(NSString *)resId ofPet:(NSString *)petID
{
    NSDictionary *magicDict = [[self.petDataDict objectForKey:petID] objectForKey:K_PET_DATA_CATEGORY_MAGIC];
    CPUIModelPetMagicAnim *magicAnim = [magicDict objectForKey:resId];
    
    return magicAnim;
}

- (NSDictionary *)allFeelingObjects
{
    @synchronized(self)
    {
        NSDictionary *feelingDict = [[self.petDataDict objectForKey:K_DEFAULT_PET_ID] objectForKey:K_PET_DATA_CATEGORY_FEELING];
        
        return feelingDict;
    }
}

#if 0
- (CPUIModelPetFeelingAnim *)feelingObjectOfID:(NSString *)resID
{
    @synchronized(self)
    {
        //TODO:
//        return [self getFeelingObjectOfID:resID];
        return [self getFeelingObject:resID ofPet:K_DEFAULT_PET_ID];
    }
}
#endif

- (CPUIModelPetFeelingAnim *)feelingObject:(NSString *)resID ofPet:(NSString *)petID
{
    return [self getFeelingObject:resID ofPet:petID];
}

- (NSArray *)allSmallAnimObjects
{
    @synchronized(self)
    {
//        return [self.smallAnimDict allValues];
        NSMutableArray *smallanimArray = [[NSMutableArray alloc] init];
        
        NSArray *keyArray = [self.petDataDict allKeys];
        for( NSString *key in keyArray )
        {
            NSDictionary *smallAnimDict = [[self.petDataDict objectForKey:key] objectForKey:K_PET_DATA_CATEGORY_SMALLANIM];
            if( smallAnimDict && [smallAnimDict count] > 0 )
            {
                [smallanimArray addObjectsFromArray:[smallAnimDict allValues]];
            }
        }
        
        return smallanimArray;
    }
}

- (CPUIModelPetSmallAnim *)smallAnimObect:(NSString *)resID ofPet:(NSString *)petID
{
    NSDictionary *smallAnimDict = [[self.petDataDict objectForKey:petID] objectForKey:K_PET_DATA_CATEGORY_SMALLANIM];
    CPUIModelPetSmallAnim *smallAnim = [smallAnimDict objectForKey:resID];
    
    return smallAnim;
}

- (CPUIModelPetSmallAnim *)smallAnimObectOfID:(NSString *)resID
{
//    return [self.smallAnimDict objectForKey:resID];
    
    //.default only.
    NSDictionary *smallAnimDict = [[self.petDataDict objectForKey:K_DEFAULT_PET_ID] objectForKey:K_PET_DATA_CATEGORY_SMALLANIM];
    return [smallAnimDict objectForKey:resID];
}

- (CPUIModelPetSmallAnim *)smallAnimObectOfEscapeChar:(NSString *)escChar
{
    @synchronized(self)
    {
        NSString *k = [self.smallAnimEscpDict objectForKey:escChar];
//        return [self.smallAnimDict objectForKey:k];
        
        return [self smallAnimObectOfID:k];
    }
}

- (void)downloadPetAllRes:(NSString *)petID
{
    @synchronized(self)
    {
        NSArray *ary = [self.pendingResOpDict objectForKey:petID];
        
        if([ary count] ==0)
        {
            [self.pendingResOpDict removeObjectForKey:petID];
            
            return;
        }
        
        CPUIModelPetInfo *petInfo = [self.petInfoDict objectForKey:petID];
        
        for( NSString *resID in ary )
        {
            //如果resID已经在挂起项中，则什么都不做。
            //这种情形下上述注释不应该发生。
            
            CPUIModelPetElemInfo *elem = [petInfo petElemOfResID:resID];
            if( elem )
            {
#if 0
                //标记下载项
                [[self.pendingResOpDict objectForKey:petID] addObject:elem.elemID];
                //下载资源
                NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                NSString *accName = [[[CPSystemEngine sharedInstance] accountModel] loginName];
                NSString *accDir = [docDir stringByAppendingPathComponent:accName];
                NSString *tempDir = [accDir stringByAppendingPathComponent:@"pet/temp/"];
                NSString *dstPath = [NSString stringWithFormat:@"%@/%@.zip", tempDir, resID];
                CPLogInfo(@"dstPath:%@\n", dstPath);
                
                NSMutableDictionary *ctxDict = [NSMutableDictionary dictionary];
                [ctxDict setObject:petID forKey:@"petID"];
                [ctxDict setObject:resID forKey:@"resID"];
                [ctxDict setObject:dstPath forKey:@"localPath"];
                [ctxDict setObject:[NSNumber numberWithInt:K_PETRES_DOWNLOAD_TYPE_PETRES] forKey:@"downloadType"];
                [ctxDict setObject:elem.elemType forKey:@"resType"];
                
                [[[CPSystemEngine sharedInstance] httpEngine] downloadPetResOf:resID
                                                                     forModule:self.class
                                                                          from:elem.elemRemoteURL
                                                                        toFile:dstPath
                                                                 andContextObj:ctxDict];
#endif
                //标记下载项
                [[self.pendingResOpDict objectForKey:petID] addObject:elem.elemID];
                //下载资源
                [[CPSystemEngine sharedInstance] downloadPetRes:elem ofType:K_PETRES_DOWNLOAD_TYPE_PETRES];
            }
        }
    }
}

- (void)downloadPetRes:(NSString *)resID ofPet:(NSString *)petID
{
    @synchronized(self)
    {
        CPUIModelPetInfo *petInfo = [self.petInfoDict objectForKey:petID];
        
        if( !petInfo )
        {
            //如果pendingResOpDict中存在petID，说明此pet相关信息及数据已经在处理。直接返回。
            if([self.pendingResOpDict objectForKey:petID])
            {
                if( ![[self.pendingResOpDict objectForKey:petID] containsObject:resID] )
                {
                    [[self.pendingResOpDict objectForKey:petID] addObject:resID];
                }
                
                return;
            }
            
            //增加／标记 下载项，挂起。
            NSMutableArray *resArray = [[NSMutableArray alloc] init];
            [resArray addObject:resID];
            [self.pendingResOpDict setObject:resArray forKey:petID];
            
            //下载描述文件
            [[CPSystemEngine sharedInstance] downloadPetRes:petID ofType:K_PETRES_DOWNLOAD_TYPE_PETCFG];
        }
        else
        {
            //如果resID已经在挂起项中，则什么都不做。
            if([[self.pendingResOpDict objectForKey:petID] containsObject:resID])
            {
                return;
            }
            
            //下载
            CPUIModelPetElemInfo *elem = [petInfo petElemOfResID:resID];
            if( elem )
            {
                //标记下载项
                [[self.pendingResOpDict objectForKey:petID] addObject:elem.elemID];
                //下载资源
                [[CPSystemEngine sharedInstance] downloadPetRes:elem ofType:K_PETRES_DOWNLOAD_TYPE_PETRES];
            }
        }
    }
}

- (void)downloadAllPetResForV06:(NSString *)petID
{
    @synchronized(self)
    {        
        NSArray *ary = [[[self.petDataDict objectForKey:K_DEFAULT_PET_ID] objectForKey:K_PET_DATA_CATEGORY_MAGIC] allValues];
        for( CPUIModelPetMagicAnim *mg in ary )
        {
            if( !mg.isAvailable )
            {
                CPLogInfo(@"aaaaaaaa--------%@:\n", mg.resourceID);
                [self downloadPetRes:mg.resourceID ofPet:petID];
            }
        }
    }
}

- (BOOL)isAllFeelingResAvailable
{
    @synchronized(self)
    {
        BOOL flag = YES;
        
        NSDictionary *feelingsDict = [self allFeelingObjects];
        
        NSMutableArray *feelingsArray = [[NSMutableArray alloc] init];
        
        NSArray *tempArray = [[feelingsDict valueForKey:PET_FEELING_TYPE_SAD] allValues];
        
        if(tempArray && 0 < [tempArray count])
        {
            [feelingsArray addObjectsFromArray:tempArray];
        }
        
        tempArray = nil;
        tempArray = [[feelingsDict valueForKey:PET_FEELING_TYPE_HAPPY] allValues];
        if(tempArray && 0 < [tempArray count])
        {
            [feelingsArray addObjectsFromArray:tempArray];
        }
        
        tempArray = nil;
        tempArray = [[feelingsDict valueForKey:PET_FEELING_TYPE_LOVE] allValues];
        if(tempArray && 0 < [tempArray count])
        {
            [feelingsArray addObjectsFromArray:tempArray];
        }
        
        for( CPUIModelPetFeelingAnim *mg in feelingsArray )
        {
            if( !mg.isAvailable )
            {
                flag = NO;
                break;
            }
        }
        
        return flag;
    }
}

- (void)downloadAllFeelingResForV06:(NSString *)petID
{
    @synchronized(self)
    {        
        NSDictionary *feelingsDict = [self allFeelingObjects];
        
        NSMutableArray *feelingsArray = [[NSMutableArray alloc] init];
        
        NSArray *tempArray = [[feelingsDict valueForKey:PET_FEELING_TYPE_SAD] allValues];
        
        if(tempArray && 0 < [tempArray count])
        {
            [feelingsArray addObjectsFromArray:tempArray];
        }
        
        tempArray = nil;
        tempArray = [[feelingsDict valueForKey:PET_FEELING_TYPE_HAPPY] allValues];
        if(tempArray && 0 < [tempArray count])
        {
            [feelingsArray addObjectsFromArray:tempArray];
        }
        
        tempArray = nil;
        tempArray = [[feelingsDict valueForKey:PET_FEELING_TYPE_LOVE] allValues];
        if(tempArray && 0 < [tempArray count])
        {
            [feelingsArray addObjectsFromArray:tempArray];
        }

        for( CPUIModelPetFeelingAnim *mg in feelingsArray )
        {
            if( !mg.isAvailable )
            {
                CPLogInfo(@"ssssssssssss--------%@:\n", mg.resourceID);
                [self downloadPetRes:mg.resourceID ofPet:petID];
            }
        }
    }
}

- (void)downloadPetResOf:(NSString *)resID
                    from:(NSString *)remoteURL
                  foFile:(NSString *)dstFile
           andContextObj:(NSObject *)contextObj
{
    [[[CPSystemEngine sharedInstance] httpEngine] downloadPetResOf:resID
                                                         forModule:self.class
                                                              from:remoteURL
                                                            toFile:dstFile
                                                     andContextObj:contextObj];
}

- (void) handlePetResDownloadProgress:(double)progress
{
//    CPLogInfo(@"progress:%f\n", progress);
}

- (void) handlePetResDownloadResult:(NSNumber *)resultCode
                           ofPetRes:(NSString *)resID
                      andContextObj:(NSObject *)contextObj
{
    CPLogInfo(@"resultCode:%@\n", resultCode);
    CPLogInfo(@"resID:%@\n", resID);
    
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"DLDCMP"
//                                                        message:[NSString stringWithFormat:@"%@:%d", resID, [resultCode intValue]]
//                                                       delegate:nil 
//                                              cancelButtonTitle:@"Ok" 
//                                              otherButtonTitles:nil];
//    [alertView show];
    
//    [[CPSystemEngine sharedInstance] updatePetResourceDataWithResID:resID andObj:contextObj];
    [[CPSystemEngine sharedInstance] updatePetResourceDataWithResult:resultCode andResID:resID andObj:contextObj];
}

- (void)setFeelingAnimDldStatus:(PetResDownloadStatus)status ofRes:(NSString *)resID andPet:(NSString *)petID
{
    @synchronized(self)
    {
//        [[self feelingObjectOfID:resID] markResDLDStatus:status];
        [[self getFeelingObject:resID ofPet:petID] markResDLDStatus:status];
    }
}

- (void)setMagicAnimDldStatus:(PetResDownloadStatus)status ofRes:(NSString *)resID andPet:(NSString *)petID
{
    @synchronized(self)
    {
        [self magicObject:resID ofPet:petID];
    }
}

- (void)startInitialDld
{
//    if( K_PETRES_MARK_TYPE_DOWNLOADING == [petData.mark intValue] )
//    {
//        if([self.pendingResOpDict objectForKey:petData.petResID])
//        {
//            if( ![[self.pendingResOpDict objectForKey:petData.petResID] containsObject:petData.dataID] )
//            {
//                [[self.pendingResOpDict objectForKey:petData.petResID] addObject:petData.dataID];
//            }
//        }
//        else
//        {
//            NSMutableArray *resArray = [[NSMutableArray alloc] init];
//            [resArray addObject:petData.dataID];
//            [self.pendingResOpDict setObject:resArray forKey:petData.petID];
//        }
//    }
    NSArray *keys = [_tempPedingResDldRCDDict allKeys];
    for( NSString *key in keys )
    {
        NSArray *ary = [_tempPedingResDldRCDDict objectForKey:key];
        for( NSString *resId in ary )
        {
            [self downloadPetRes:resId ofPet:key];
        }
    }
    
    _tempPedingResDldRCDDict = nil;
}

@end

//-----------------------------------
//|   p  ! r  | r  | r  | r  |
//-----------------------------------
//|   p  ! r  | r  | r  |
//-----------------------------------
//|   p  ! r  | r  | r  | r  | r  | r
//------------------------------------
