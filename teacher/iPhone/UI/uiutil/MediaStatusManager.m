//
//  MediaStatusManager.m
//  iCouple
//
//  Created by ming bright on 12-7-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MediaStatusManager.h"

@implementation MediaStatusManager

@synthesize isVideoRecording;
@synthesize isVideoPlaying;
@synthesize isAudioRecording;
@synthesize isAudioPlaying;

static MediaStatusManager *_instance = nil;

+(MediaStatusManager *)sharedInstance{
    
    @synchronized(self){
        if (_instance == nil){
            _instance = [[MediaStatusManager alloc] init];
        }
    }
    return _instance;
}

-(void)resetStatus{
    
    self.isVideoRecording = NO;
    self.isVideoPlaying = NO;
    
    self.isAudioRecording = NO;
    self.isAudioPlaying = NO;
}

-(id)init{
    self = [super init];
    if (self) {
        [self resetStatus];
    }
    return self;
}

-(BOOL)canPlaySound{
    
    if ((!isVideoRecording)
        &&(!isVideoPlaying)
        &&(!isAudioRecording)
        &&(!isAudioPlaying)
        ){
        
        return YES;
    }
    
    return NO;
}


@end
