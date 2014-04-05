//
//  CPUIModelPetFeelingAnim.m
//  iCouple
//
//  Created by yl s on 12-5-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPUIModelPetFeelingAnim.h"

#import "CPUIModelPetConst.h"
#import "CPDBModelPetData.h"

//---------------------------------------------------------------------------------------------------
//interface (private)
//---------------------------------------------------------------------------------------------------
@interface CPUIModelPetFeelingAnim (/*private*/)
{
    NSString *_resID;
    NSString *_petResID;
    NSString *_dispName;
    NSString *_thumb;
    NSNumber *_type;
    NSNumber *_zipSize;
    
    NSNumber *_available;
    NSNumber *_downloadState; //PetResDownloadStatus
    
    NSString *_sndDesc;
    NSString *_rcvDesc;
    
    NSNumber *_animWidth;
    NSNumber *_animHeight;
    
    NSMutableArray *_animSlides;
    NSMutableArray *_audioSlide;
}

@property (strong, nonatomic) NSString *resID;
@property (strong, nonatomic) NSString *petResID;
@property (strong, nonatomic) NSString *dispName;
@property (strong, nonatomic) NSString *thumb;
@property (strong, nonatomic) NSNumber *type;
@property (strong, nonatomic) NSNumber *available;
@property (strong, nonatomic) NSNumber *downloadState;
@property (strong, nonatomic) NSNumber *zipSize;
@property (strong, nonatomic) NSString *sndDesc;
@property (strong, nonatomic) NSString *rcvDesc;
@property (strong, nonatomic) NSNumber *animWidth;
@property (strong, nonatomic) NSNumber *animHeight;
@property (strong, nonatomic) NSMutableArray *animSlides;
@property (strong, nonatomic) NSMutableArray *audioSlides;

@end

//---------------------------------------------------------------------------------------------------
//implementation
//---------------------------------------------------------------------------------------------------
@implementation CPUIModelPetFeelingAnim

@synthesize resID = _resID;
@synthesize petResID = _petResID;
@synthesize dispName = _dispName;
@synthesize thumb = _thumb;
@synthesize type = _type;
@synthesize available = _available;
@synthesize downloadState = _downloadState;
@synthesize zipSize = _zipSize;
@synthesize sndDesc = _sndDesc;
@synthesize rcvDesc = _rcvDesc;
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

+ (CPUIModelPetFeelingAnim *)initFromConfig:(NSString *)fname
{
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL flag = [fm fileExistsAtPath:fname];
    if(!flag)
    {
        CPLogError(@"file not exist!");
        return nil;
    }
    
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfFile:fname options:0 error:&error];
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
    
    CPUIModelPetFeelingAnim* anim = [[CPUIModelPetFeelingAnim alloc] init];
    anim.resID = [dict objectForKey:@"id"];
    anim.dispName = [dict objectForKey:@"name"];
    anim.sndDesc = [dict objectForKey:@"snddesc"];
    anim.rcvDesc = [dict objectForKey:@"rcvdesc"];
    anim.animWidth = [dict objectForKey:@"width"];
    anim.animHeight = [dict objectForKey:@"height"];
    
//    anim.available = [NSNumber numberWithBool:YES];

    NSString *typeString = [dict objectForKey:@"type"];
    if([typeString isEqualToString:PET_FEELING_TYPE_LOVE])
    {
        anim.type = [NSNumber numberWithInt:FeelingCategoryLove];
    }
    else if([typeString isEqualToString:PET_FEELING_TYPE_HAPPY])
    {
        anim.type = [NSNumber numberWithInt:FeelingCategoryhappy];
    }
    else if([typeString isEqualToString:PET_FEELING_TYPE_SAD])
    {
        anim.type = [NSNumber numberWithInt:FeelingCategorySad];
    }
    else
    {
        anim.type = [NSNumber numberWithInt:FeelingCategoryUnknown];
        CPLogError(@"unknown feeling anim!\n");
    }
    
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

+ (CPUIModelPetFeelingAnim *)initFromProto:(CPDBModelPetData *)proto
{    
    NSAssert([proto.dataType intValue] == K_PET_DATA_TYPE_FEELING, @"invalid proto");
    
    CPUIModelPetFeelingAnim *anim = nil;
    
    if( ![proto.isAvailable boolValue] )
    {
        anim = [[CPUIModelPetFeelingAnim alloc] init];
        
        anim.available = [NSNumber numberWithBool:NO];
        anim.dispName = proto.name;
        anim.resID = proto.dataID;
        anim.petResID = proto.petResID;
        anim.thumb = proto.thumb;
        anim.type = [NSNumber numberWithInt:[proto.category intValue] ];
        anim.zipSize = proto.dataSize;
        anim.animSlides = nil;
        anim.audioSlides = nil;
        
        //++
        anim.downloadState = proto.mark;
        //--
        
        return anim;
    }
    
    NSString *cfgFilePath = [NSString stringWithFormat:@"%@/%@_cfg.cfg", proto.localPath, proto.dataID];
    anim = [CPUIModelPetFeelingAnim initFromConfig:cfgFilePath];
    
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

- (FeelingCategory)category
{
    return [self.type intValue];
}

- (NSString *)senderDesc
{
    return self.sndDesc;
}

- (NSString *)receiverDesc
{
    return self.rcvDesc;
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

- (NSNumber *)size
{
    return self.zipSize;
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
