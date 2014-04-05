//
//  CPUIModelPetInfo.m
//  iCouple
//
//  Created by yl s on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPUIModelPetInfo.h"
#import "CPUIModelPetElemInfo.h"
#import "CPUIModelPetConst.h"

#import "CPDBModelPetInfo.h"

#define K_PETINFO_ID                    @"id"
#define K_PETINFO_NAME                  @"name"
#define K_PETINFO_THUMB                 @"thumb"

#define K_PETINFO_ACTION                @"action"
#define K_PETINFO_MAGIC                 @"magic"
#define K_PETINFO_FEELING               @"feeling"
#define K_PETINFO_SMALLANIM             @"smallanim"

#define K_PETINFO_ELEM_ID               @"id"
#define K_PETINFO_ELEM_NAME             @"name"
//only used by feeling
#define K_PETINFO_ELEM_CATEGORY         @"type"
#define K_PETINFO_ELEM_SIZE             @"size"
#define K_PETINFO_ELEM_THUMB            @"thumb"
#define K_PETINFO_ELEM_FILE             @"file"


@interface CPUIModelPetInfo(/*Private API*/)

@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *thumb;
@property (strong, nonatomic) NSNumber *isDefault;

@property (strong, nonatomic) NSMutableDictionary *actionInfoDict;
@property (strong, nonatomic) NSMutableDictionary *feelingInfoDict;
@property (strong, nonatomic) NSMutableDictionary *magicInfoDict;
@property (strong, nonatomic) NSMutableDictionary *smallanimDict;

@end

@implementation CPUIModelPetInfo

@synthesize ID = _ID;
@synthesize name = _name;
@synthesize thumb = _thumb;
@synthesize isDefault = _isDefault;

@synthesize actionInfoDict = _actionInfoDict;
@synthesize feelingInfoDict = _feelingInfoDict;
@synthesize magicInfoDict = _magicInfoDict;
@synthesize smallanimDict = _smallanimDict;

- (id)init
{
	if ((self = [super init]))
	{   
        self.actionInfoDict = [NSMutableDictionary dictionary];
        self.feelingInfoDict = [NSMutableDictionary dictionary];
        self.magicInfoDict = [NSMutableDictionary dictionary];
        self.smallanimDict = [NSMutableDictionary dictionary];
	}
    
	return self;
}

+ (CPUIModelPetInfo *)initFromProto:(CPDBModelPetInfo *)proto
{
    CPUIModelPetInfo *petInfo = [[CPUIModelPetInfo alloc] init];
    
    petInfo.ID = proto.petID;
    petInfo.name = proto.petName;
    petInfo.isDefault = proto.isDefault;
    
    NSString *path = proto.localPath;
    NSString *fname = [NSString stringWithFormat:@"%@/%@.cfg", proto.localPath, proto.petID];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL flag = [fm fileExistsAtPath:fname];
    if(!flag)
    {
        CPLogError(@"file not exist!");
        return petInfo;
    }
    
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfFile:fname options:0 error:&error];
    if(error)
    {
        CPLogError(@"initDataFromFileError!!!\n");
        return petInfo;
    }
    
    id dict = [data objectFromJSONDataWithParseOptions:JKParseOptionValidFlags error:&error];
    if(error)
    {
        CPLogError(@"JSON Parsing Error: %@", error);
        return petInfo;
    }
    
    petInfo.ID = [dict objectForKey:K_PETINFO_ID];
    petInfo.name = [dict objectForKey:K_PETINFO_NAME];
//    petInfo.thumb = [dict objectForKey:K_PETINFO_THUMB];
    NSString *thumb = [dict objectForKey:K_PETINFO_THUMB];
    petInfo.thumb = [NSString stringWithFormat:@"%@/%@", path, thumb];
    
    NSArray *actionArray = [dict objectForKey:K_PETINFO_ACTION];
    for( NSDictionary *actionDict in actionArray)
    {
        CPUIModelPetElemInfo *elem = [[CPUIModelPetElemInfo alloc] init];
        elem.elemID = [actionDict objectForKey:K_PETINFO_ELEM_ID];
        elem.elemName = [actionDict objectForKey:K_PETINFO_ELEM_NAME];
        elem.elemPetResID = petInfo.ID;
        elem.elemType = [NSNumber numberWithInt:K_PET_DATA_TYPE_ACTION];
        elem.elemSize = [actionDict objectForKey:K_PETINFO_ELEM_SIZE];
        elem.elemThumb = [actionDict objectForKey:K_PETINFO_ELEM_THUMB];
        elem.elemRemoteURL = [actionDict objectForKey:K_PETINFO_ELEM_FILE];
        
        [petInfo.actionInfoDict setObject:elem forKey:elem.elemID];
    }

    NSArray *feelingArray = [dict objectForKey:K_PETINFO_FEELING];
    for( NSDictionary *feelingDict in feelingArray)
    {
        CPUIModelPetElemInfo *elem = [[CPUIModelPetElemInfo alloc] init];
        elem.elemID = [feelingDict objectForKey:K_PETINFO_ELEM_ID];
        elem.elemName = [feelingDict objectForKey:K_PETINFO_ELEM_NAME];
        elem.elemPetResID = petInfo.ID;
        elem.elemType = [NSNumber numberWithInt:K_PET_DATA_TYPE_FEELING];
        elem.elemCategory = [feelingDict objectForKey:K_PETINFO_ELEM_CATEGORY];
        elem.elemSize = [feelingDict objectForKey:K_PETINFO_ELEM_SIZE];
        elem.elemThumb = [feelingDict objectForKey:K_PETINFO_ELEM_THUMB];
        elem.elemRemoteURL = [feelingDict objectForKey:K_PETINFO_ELEM_FILE];
        
        [petInfo.feelingInfoDict setObject:elem forKey:elem.elemID];
    }
    
    NSArray *magicArray = [dict objectForKey:K_PETINFO_MAGIC];
    for( NSDictionary *magicDict in magicArray)
    {
        CPUIModelPetElemInfo *elem = [[CPUIModelPetElemInfo alloc] init];
        elem.elemID = [magicDict objectForKey:K_PETINFO_ELEM_ID];
        elem.elemName = [magicDict objectForKey:K_PETINFO_ELEM_NAME];
        elem.elemPetResID = petInfo.ID;
        elem.elemType = [NSNumber numberWithInt:K_PET_DATA_TYPE_MAGIC];
        elem.elemSize = [magicDict objectForKey:K_PETINFO_ELEM_SIZE];
        elem.elemThumb = [magicDict objectForKey:K_PETINFO_ELEM_THUMB];
        elem.elemRemoteURL = [magicDict objectForKey:K_PETINFO_ELEM_FILE];
        
        [petInfo.magicInfoDict setObject:elem forKey:elem.elemID];
    }

    NSArray *smallanimArray = [dict objectForKey:K_PETINFO_SMALLANIM];
    for( NSDictionary *smallanimDict in smallanimArray)
    {
        CPUIModelPetElemInfo *elem = [[CPUIModelPetElemInfo alloc] init];
        elem.elemID = [smallanimDict objectForKey:K_PETINFO_ELEM_ID];
        elem.elemName = [smallanimDict objectForKey:K_PETINFO_ELEM_NAME];
        elem.elemPetResID = petInfo.ID;
        elem.elemType = [NSNumber numberWithInt:K_PET_DATA_TYPE_SMALLANIM];
        elem.elemSize = [smallanimDict objectForKey:K_PETINFO_ELEM_SIZE];
        elem.elemThumb = [smallanimDict objectForKey:K_PETINFO_ELEM_THUMB];
        elem.elemRemoteURL = [smallanimDict objectForKey:K_PETINFO_ELEM_FILE];
        
        [petInfo.smallanimDict setObject:elem forKey:elem.elemID];
    }

    return petInfo;
}

- (NSString *)petID
{
    return self.ID;
}

- (CPUIModelPetElemInfo *)petElemOfResID:(NSString *)resID
{
    if( nil == resID || 0 == resID.length )
    {
        return nil;
    }
    
    CPUIModelPetElemInfo *dstElem = nil;
    dstElem = [self.magicInfoDict objectForKey:resID];
    if( dstElem )
    {
        return dstElem;
    }
    else
    {
        dstElem = [self.feelingInfoDict objectForKey:resID];
        if( dstElem )
        {
            return dstElem;
        }
        else
        {
            dstElem = [self.actionInfoDict objectForKey:resID];
            if(dstElem)
            {
                return dstElem;
            }
            else
            {
                dstElem = [self.smallanimDict objectForKey:resID];
                if( dstElem )
                {
                    return dstElem;
                }
            }
        }
    }
    
    return dstElem;
}

@end
