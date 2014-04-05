//
//  AudioRouteChange.m
//  iCouple
//
//  Created by shuo wang on 12-7-17.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "AudioRouteChange.h"
#import <AVFoundation/AVFoundation.h>

static AudioRouteChange *audioRoute = nil;

@interface AudioRouteChange ()
-(AudioRouteChange *) initAudioRoute;
@end

@implementation AudioRouteChange

+(AudioRouteChange *) sharedInstance{
    if (nil == audioRoute) {
        audioRoute = [[super alloc] initAudioRoute];
    }
    return audioRoute;
}

-(AudioRouteChange *) initAudioRoute{
    self = [super init];
    
    if (self) {
        [[UIDevice currentDevice] setProximityMonitoringEnabled:YES]; 
    }
    return self;
}

-(void) beginListening{
    
    UInt32 sessionCategory = kAudioSessionCategory_MediaPlayback;
    AudioSessionSetProperty(kAudioSessionProperty_AudioCategory,sizeof(sessionCategory),&sessionCategory);   

    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,sizeof (audioRouteOverride),&audioRouteOverride);
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
//    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(sensorStateChange:)
                                                 name:@"UIDeviceProximityStateDidChangeNotification"
                                               object:nil];
}

-(void)sensorStateChange:(NSNotificationCenter *)notification;{
    if ([[UIDevice currentDevice] proximityState] == YES){
//        NSLog(@"Device is close to user");
//        UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
//        AudioSessionSetProperty(kAudioSessionProperty_OverrideAudioRoute, sizeof(audioRouteOverride), &audioRouteOverride);
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    }
    else{
//        NSLog(@"Device is not close to user");
//        UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_None;
//        AudioSessionSetProperty(kAudioSessionProperty_OverrideAudioRoute, sizeof(audioRouteOverride), &audioRouteOverride);
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    }
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
