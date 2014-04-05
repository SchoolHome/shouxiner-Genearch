//
//  CPUIModelPetSmallAnim.m
//  iCouple
//
//  Created by yl s on 12-5-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CPUIModelPetSmallAnim.h"

#import "CPUIModelPetConst.h"
#import "CPDBModelPetData.h"

//---------------------------------------------------------------------------------------------------
//interface (private)
//---------------------------------------------------------------------------------------------------
@interface CPUIModelPetSmallAnim (/*private*/)
{
    NSString *_resID;
    NSString *_dispName;
    NSString *_thumb;
    NSNumber *_available;
    NSString *_escchar;
    NSNumber *_zipSize;
    
    NSMutableArray *_animSlides;
    
}

@property (strong, nonatomic) NSString *resID;
@property (strong, nonatomic) NSString *dispName;
@property (strong, nonatomic) NSNumber *available;
@property (strong, nonatomic) NSString *escchar;
@property (strong, nonatomic) NSNumber *zipSize;
@property (strong, nonatomic) NSString *thumb;
@property (strong, nonatomic) NSMutableArray *animSlides;




@end

//---------------------------------------------------------------------------------------------------
//implementation
//---------------------------------------------------------------------------------------------------
@implementation CPUIModelPetSmallAnim

@synthesize resID = _resID;
@synthesize dispName = _dispName;
@synthesize escchar = _escchar;
@synthesize available = _available;
@synthesize zipSize = _zipSize;
@synthesize thumb = _thumb;
@synthesize animSlides = _animSlides;

@synthesize defaultImg = _defaultImg;
@synthesize animImgArray = _animImgArray;
- (id)init
{
	if ((self = [super init]))
	{   
        self.animSlides = [[NSMutableArray alloc] init];
	}
    
	return self;
}

//deprecated.
+ (CPUIModelPetSmallAnim *)initFromConfig:(NSString *)fname
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

    CPUIModelPetSmallAnim* anim = [[CPUIModelPetSmallAnim alloc] init];
    anim.resID = [dict objectForKey:@"id"];
    anim.dispName = [dict objectForKey:@"name"];
    anim.escchar = [dict objectForKey:@"escpchar"];

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

+ (CPUIModelPetSmallAnim *)initFromProto:(CPDBModelPetData *)proto
{
    NSAssert([proto.dataType intValue] == K_PET_DATA_TYPE_SMALLANIM, @"invalid proto");
    
    CPUIModelPetSmallAnim *anim = nil;
    
    if( ![proto.isAvailable boolValue] )
    {
        anim = [[CPUIModelPetSmallAnim alloc] init];
        
        anim.available = /*proto.isAvailable;*/[NSNumber numberWithBool:NO];
        anim.dispName = proto.name;
        anim.resID = proto.dataID;
        anim.thumb = proto.thumb;
        anim.zipSize = proto.dataSize;
        anim.animSlides = nil;
        
        return anim;
    }
    
    NSString *cfgFilePath = [NSString stringWithFormat:@"%@/%@_cfg.cfg", proto.localPath, proto.dataID];
    anim = [CPUIModelPetSmallAnim initFromConfig:cfgFilePath];
    
    if(anim)
    {
        anim.zipSize = proto.dataSize;
        anim.available = proto.isAvailable;
    }
    
    return anim;
}

- (NSString *)name
{
    return self.dispName;
}

- (NSString *)escapeChar
{
    return [NSString stringWithFormat:@"[%@]", self.dispName];
}

- (NSString *)resourceID
{
    return self.resID;
}

- (NSString *)thumbNail
{
    return self.thumb;
}

- (BOOL)isAvailable
{
    return [self.available boolValue];
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

@end
