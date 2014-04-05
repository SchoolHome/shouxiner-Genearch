//
//  AudioPlayerManager.m
//  iCouple
//
//  Created by shuo wang on 12-5-22.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "AudioPlayerManager.h"

@interface AudioPlayerManager ()
-(void) audioPlayerDidFinish;
@end

@implementation AudioPlayerManager
@synthesize delegate = _delegate;

static AudioPlayerManager *audioPlayerManager = nil;

+(AudioPlayerManager *) sharedManager{
    if ( nil == audioPlayerManager) {
        audioPlayerManager = [[AudioPlayerManager alloc] init];
        [[[SimpleAudioEngine sharedEngine] getCDAudioManager] setBackgroundMusicCompletionListener:audioPlayerManager selector:@selector(audioPlayerDidFinish)];
    }
    return audioPlayerManager;
}

-(void) preloadBackgroundMusic:(NSString*) filePath{
    [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:filePath];
}

-(void) playBackgroundMusic:(NSString*) filePath{
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:filePath];
}

-(void) playBackgroundMusic:(NSString*) filePath loop:(BOOL) loop{
    AVAudioSession *av = (AVAudioSession *)[AVAudioSession sharedInstance];
    if (av.category != AVAudioSessionCategoryPlayAndRecord) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    }
//    if ([AVAudioSession sharedInstance].category != AVAudioSessionCategorySoloAmbient) {
//        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
//    }

    UInt32 doChangeDefaultRoute = 1;        
    AudioSessionSetProperty (kAudioSessionProperty_OverrideCategoryDefaultToSpeaker, sizeof (doChangeDefaultRoute), &doChangeDefaultRoute);
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:filePath loop:loop];
}

-(void) stopBackgroundMusic{
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
}

-(void) playEffect:(NSString *)effectPath{
    [[SimpleAudioEngine sharedEngine] playEffect:effectPath];
}

-(void) stopEffect{
    [[SimpleAudioEngine sharedEngine] stopEffect:1];
}

-(void) pauseBackgroundMusic{
    [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
}

-(void) resumeBackgroundMusic{
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
}

-(void) rewindBackgroundMusic{
    [[SimpleAudioEngine sharedEngine] rewindBackgroundMusic];
}

-(BOOL) isBackgroundMusicPlaying{
    return [[SimpleAudioEngine sharedEngine] isBackgroundMusicPlaying];
}

-(void) audioPlayerDidFinish{
    if (nil != self.delegate && [self.delegate respondsToSelector:@selector(audioPlayerDidFinishPlaying)]) {
        [self.delegate audioPlayerDidFinishPlaying];
    }
}

+(void) end{
    [SimpleAudioEngine  end];
}

@end
