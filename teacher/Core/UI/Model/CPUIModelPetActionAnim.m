//
//  CPUIModelPetActionAnim.m
//  iCouple
//
//  Created by yl s on 12-5-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPUIModelPetActionAnim.h"

#import "CPUIModelPetConst.h"
#import "CPDBModelPetData.h"

#define KPetActionAnimDuration  50    /*ms*/

//---------------------------------------------------------------------------------------------------
//interface (private)
//---------------------------------------------------------------------------------------------------
@interface CPUIModelPetActionAnim (/*private*/)
{
    NSString *_resID;
    NSString *_petResID;
    NSString *_dispName;
    NSString *_thumb;
    NSNumber *_zipSize;
    
    NSNumber *_animWidth;
    NSNumber *_animHeight;
    
    NSNumber *_available;
    NSNumber *_downloadState; //PetResDownloadStatus
    
    NSMutableArray *_animSlides;
}

@property (strong, nonatomic) NSString *resID;
@property (strong, nonatomic) NSString *petResID;
@property (strong, nonatomic) NSString *dispName;
@property (strong, nonatomic) NSString *thumb;
@property (strong, nonatomic) NSNumber *zipSize;
@property (strong, nonatomic) NSNumber *animWidth;
@property (strong, nonatomic) NSNumber *animHeight;
@property (strong, nonatomic) NSNumber *available;
@property (strong, nonatomic) NSNumber *downloadState;
@property (strong, nonatomic) NSMutableArray *animSlides;

@end

//---------------------------------------------------------------------------------------------------
//implementation
//---------------------------------------------------------------------------------------------------
@implementation CPUIModelPetActionAnim

@synthesize resID = _resID;
@synthesize petResID = _petResID;
@synthesize dispName = _dispName;
@synthesize thumb = _thumb;
@synthesize zipSize = _zipSize;
@synthesize animWidth = _animWidth;
@synthesize animHeight = _animHeight;
@synthesize available = _available;
@synthesize downloadState = _downloadState;
@synthesize animSlides = _animSlides;

- (id)init
{
	if ((self = [super init]))
	{   
        self.animSlides = [[NSMutableArray alloc] init];
	}
    
	return self;
}

//deprecated.
+ (CPUIModelPetActionAnim *)initFromConfig:(NSString *)fname
{
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL flag = [fm fileExistsAtPath:fname];
    if(!flag)
    {
        CPLogError(@"file not exist!");
        return nil;
    }
    
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfFile:fname/*path*/ options:0 error:&error];
    if(error)
    {
        CPLogError(@"initDataFromFileError!!!\n");
        return nil;
    }
    
    id dict = [data objectFromJSONDataWithParseOptions:JKParseOptionValidFlags error:&error];
    if(error)
    {
        CPLogError(@"JSON Parsing Error: %@", error);
        return nil;
    }
    
    CPUIModelPetActionAnim* anim = [[CPUIModelPetActionAnim alloc] init];
    anim.resID = [dict objectForKey:@"id"];
    anim.dispName = [dict objectForKey:@"name"];
    anim.animWidth = [dict objectForKey:@"width"];
    anim.animHeight = [dict objectForKey:@"height"];
    
    anim.available = [NSNumber numberWithBool:YES];

    NSString *thumbfile = [dict objectForKey:@"thumb"];
    NSString *mainDir = [fname substringToIndex:[fname rangeOfString:@"/" options:NSBackwardsSearch].location];
    anim.thumb = [NSString stringWithFormat:@"%@/%@", mainDir, thumbfile];
    
    NSArray *frameArray = [dict objectForKey:@"frameinfo"];
    for( NSDictionary *frame in frameArray)
    {
        CPUIModelAnimSlideInfo *slide = [[CPUIModelAnimSlideInfo alloc] init];
        slide.serialNum = [frame objectForKey:@"seq"];
        slide.duration = [frame objectForKey:@"duration"];
        NSString *file = [frame objectForKey:@"file"];
        slide.fileName = [NSString stringWithFormat:@"%@/%@", mainDir, file];
        slide.mimeType = [frame objectForKey:@"mimetype"];
        
        [anim.animSlides addObject:slide];
    }
    
    return anim;
}

+ (CPUIModelPetActionAnim *)initFromProto:(CPDBModelPetData *)proto
{    
    NSAssert([proto.dataType intValue] == K_PET_DATA_TYPE_ACTION, @"invalid proto");
    
    CPUIModelPetActionAnim *anim = nil;
    
    if( ![proto.isAvailable boolValue] )
    {
        anim = [[CPUIModelPetActionAnim alloc] init];
        
        anim.available = [NSNumber numberWithBool:NO];
        anim.dispName = proto.name;
        anim.resID = proto.dataID;
        anim.petResID = proto.petResID;
        anim.zipSize = proto.dataSize;
        anim.thumb = proto.thumb;
        anim.animSlides = nil;
        
        //++
        anim.downloadState = proto.mark;
        //--
        
        return anim;
    }
    
    NSString *cfgFilePath = [NSString stringWithFormat:@"%@/%@_cfg.cfg", proto.localPath, proto.dataID];
    anim = [CPUIModelPetActionAnim initFromConfig:cfgFilePath];
    
    if(anim)
    {
        anim.petResID = proto.petResID;
        anim.zipSize = proto.dataSize;
        anim.available = proto.isAvailable;
    }
        
    return anim;
}

- (NSString *)name
{
    return self.dispName;
}

- (NSString *)resourceID
{
    return self.resID;
}

- (NSString *)petID
{
    return self.petResID;
}

- (NSString *)thumbNail
{
    return self.thumb;
}

- (NSNumber *)size;
{
    return self.zipSize;
}

- (NSNumber *)width
{
    return self.animWidth;
}

- (NSNumber *)height
{
    return self.animHeight;
}

- (BOOL)isAvailable
{
    return [self.available boolValue];
}

- (NSInteger)downloadStatus
{
    return [self.downloadState intValue];
}

- (NSUInteger)animSlideCount
{
    if(!self.animSlides)
    {
        return 0;
    }
    else
    {
        return [self.animSlides count];
    }
}

- (NSArray*)allAnimSlides
{
    return self.animSlides;
}

@end
