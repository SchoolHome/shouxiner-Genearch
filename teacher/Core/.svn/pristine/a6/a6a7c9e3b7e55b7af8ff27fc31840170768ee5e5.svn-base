//
//  CPUIModelPetMagicAnim.m
//  iCouple
//
//  Created by yl s on 12-5-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPUIModelPetMagicAnim.h"

#import "CPUIModelPetConst.h"
#import "CPDBModelPetData.h"

//---------------------------------------------------------------------------------------------------
//interface (private)
//---------------------------------------------------------------------------------------------------
@interface CPUIModelPetMagicAnim (/*private*/)
{
    NSString *_resID;
    NSString *_petResID;
    NSString *_dispName;
    NSString *_thumb;
    NSNumber *_zipSize;
    NSNumber *_available;
    NSNumber *_downloadState; //PetResDownloadStatus
    
    NSNumber *_animWidth;
    NSNumber *_animHeight;
    
    NSMutableArray *_animSlides;
    NSMutableArray *_audioSlide;
}
//@property (strong, nonatomic) NSMutableArray *frames;

@property (strong, nonatomic) NSString *resID;
@property (strong, nonatomic) NSString *petResID;
@property (strong, nonatomic) NSString *dispName;
@property (strong, nonatomic) NSString *thumb;
@property (strong, nonatomic) NSNumber *zipSize;
@property (strong, nonatomic) NSNumber *available;
@property (strong, nonatomic) NSNumber *downloadState;

@property (strong, nonatomic) NSNumber *animWidth;
@property (strong, nonatomic) NSNumber *animHeight;

@property (strong, nonatomic) NSMutableArray *animSlides;
@property (strong, nonatomic) NSMutableArray *audioSlides;

@end

//---------------------------------------------------------------------------------------------------
//implementation
//---------------------------------------------------------------------------------------------------
@implementation CPUIModelPetMagicAnim

@synthesize resID = _resID;
@synthesize petResID = _petResID;
@synthesize dispName = _dispName;
@synthesize thumb = _thumb;
@synthesize zipSize = _zipSize;
@synthesize available = _available;
@synthesize downloadState = _downloadState;

@synthesize animWidth = _animWidth;
@synthesize animHeight = _animHeight;

@synthesize animSlides = _animSlides;
@synthesize audioSlides = _audioSlide;

- (id)init
{
	if ((self = [super init]))
	{   
        self.animSlides = [[NSMutableArray alloc] init];
        self.audioSlides = [[NSMutableArray alloc] init];
	}
    
	return self;
}

+ (CPUIModelPetMagicAnim *)initFromConfig:(NSString *)fname
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
    
    CPUIModelPetMagicAnim* anim = [[CPUIModelPetMagicAnim alloc] init];
    anim.resID = [dict objectForKey:@"id"];
    anim.dispName = [dict objectForKey:@"name"];
    anim.animWidth = [dict objectForKey:@"width"];
    anim.animHeight = [dict objectForKey:@"height"];

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

    NSArray *audioArray = [dict objectForKey:@"audioinfo"];
    for( NSDictionary *audio in audioArray)
    {
        CPUIModelAudioSlideInfo *slide = [[CPUIModelAudioSlideInfo alloc] init];
        slide.serialNum = [audio objectForKey:@"seq"];
        slide.startTime = [audio objectForKey:@"start"];
        NSString *file = [audio objectForKey:@"file"];
        slide.fileName = [NSString stringWithFormat:@"%@/%@", mainDir, file];
        slide.mimeType = [audio objectForKey:@"mimetype"];
        
        [anim.audioSlides addObject:slide];
    }
    
    return anim;
}

+ (CPUIModelPetMagicAnim *)initFromProto:(CPDBModelPetData *)proto
{    
    NSAssert([proto.dataType intValue] == K_PET_DATA_TYPE_MAGIC, @"invalid proto");
    
    CPUIModelPetMagicAnim *anim = nil;
    
    if( ![proto.isAvailable boolValue] )
    {
        anim = [[CPUIModelPetMagicAnim alloc] init];
        
        anim.available = /*proto.isAvailable;*/[NSNumber numberWithBool:NO];
        anim.dispName = proto.name;
        anim.resID = proto.dataID;
        anim.petResID = proto.petResID;
        anim.thumb = proto.thumb;
        anim.zipSize = proto.dataSize;
        anim.animSlides = nil;
        anim.audioSlides = nil;
        
        //++
        anim.downloadState = proto.mark;
        //--
        
        return anim;
    }
    
    NSString *cfgFilePath = [NSString stringWithFormat:@"%@/%@_cfg.cfg", proto.localPath, proto.dataID];
    anim = [CPUIModelPetMagicAnim initFromConfig:cfgFilePath];
    
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

- (NSNumber *)size
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
//    NSAssert(self.slides != nil, @"inalid slides!\n");
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

- (NSUInteger)audioSlideCount
{
    if(!self.audioSlides)
    {
        return 0;
    }
    else
    {
        return [self.audioSlides count];
    }
}

- (NSArray *)allAudioSlide
{
    return self.audioSlides;
}

- (void)markResDLDStatus:(PetResDownloadStatus) status
{
    self.downloadState = [NSNumber numberWithInt:status];
}

@end
