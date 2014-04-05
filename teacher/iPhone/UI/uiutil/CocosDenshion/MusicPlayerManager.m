//
//  MusicPlayer.m
//  AudioPlayer_dev
//
//  Created by ming bright on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MusicPlayerManager.h"
#import "SimpleAudioEngine.h"

@implementation MusicPlayerManager
@synthesize audioPlayer;
@synthesize delegate;
@synthesize playerName;

static MusicPlayerManager *_instance = nil;

+(MusicPlayerManager *)sharedInstance{
    
    @synchronized(self){
        
        if (_instance == nil){
        _instance = [[self alloc] init];
        }
        
    }
    return _instance;
}

- (void)playSound:(NSString *)filePath{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if (audioSession.category != AVAudioSessionCategoryPlayAndRecord) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil]; // 请不要修改
    }
    
    UInt32 doChangeDefaultRoute = 1;        
    AudioSessionSetProperty (kAudioSessionProperty_OverrideCategoryDefaultToSpeaker, sizeof (doChangeDefaultRoute), &doChangeDefaultRoute);
    
    [[SimpleAudioEngine sharedEngine] playEffect:filePath];
}

- (void)playMusic:(NSString *)filePath playerName:(NSString *)name{
    
    
    if ([self.audioPlayer isPlaying]) {
        [self.audioPlayer stop];
    }
    
    self.playerName = name;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    
    if (audioSession.category != AVAudioSessionCategoryPlayAndRecord) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil]; // 请不要修改
    }
//    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];   // 请不要修改
    
    UInt32 doChangeDefaultRoute = 1;        
    AudioSessionSetProperty (kAudioSessionProperty_OverrideCategoryDefaultToSpeaker, sizeof (doChangeDefaultRoute), &doChangeDefaultRoute);
    
    NSString *path = filePath;
    NSURL *url = [NSURL fileURLWithPath:path];
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
    self.audioPlayer = player;
    audioPlayer.volume = 1.0f;
    audioPlayer.meteringEnabled = YES;
    audioPlayer.delegate = self;
    player = nil;
    [self prepareToPlay];
    [self play];
}

- (BOOL)prepareToPlay{
    return [self.audioPlayer prepareToPlay];
}

-(NSTimeInterval )currentTime{
    return self.audioPlayer.currentTime;
}


-(CGFloat)musicLength:(NSString *)path{
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if (audioSession.category != AVAudioSessionCategoryPlayAndRecord) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil]; // 请不要修改
    }
    
//    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];  // 请不要修改
    NSURL *url = [NSURL fileURLWithPath:path];
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
    CGFloat length = player.duration;
    player = nil;
    
    return length;
}


-(void)update:(NSTimer *)timer_{
    if ([self.delegate respondsToSelector:@selector(musicPlayer:playToTime:playerName:)]) {
        [self.delegate musicPlayer:self playToTime:[self currentTime] playerName:self.playerName];
    }
}

- (BOOL)play{
    
    if (!timer) {
        
        if ([timer isValid]) {
            [timer invalidate];
            timer = nil;
        }
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update:) userInfo:nil repeats:YES];
    }
    
    return [self.audioPlayer play];
}



- (BOOL)playAtTime:(NSTimeInterval)time{
    
    if (!timer) {
        
        if ([timer isValid]) {
            [timer invalidate];
            timer = nil;
        }
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update:) userInfo:nil repeats:YES];
    }
    return [self.audioPlayer playAtTime:time];
}

- (void)pause{
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
    return [self.audioPlayer pause];
}

- (void)stop{
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
    return [self.audioPlayer stop];
}

//- (void)updateMeters{
//    CPLogInfo(@"updateMeters");
//    CPLogInfo(@"%f",audioPlayer.currentTime);
//}

- (BOOL)isPlaying{
    
    return [self.audioPlayer isPlaying];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    CPLogInfo(@"audioPlayerDidFinishPlaying");
    
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
    
    if ([self.delegate respondsToSelector:@selector(musicPlayerDidFinishPlaying:playerName:)]) {
        [self.delegate musicPlayerDidFinishPlaying:self playerName:self.playerName];
    }
    
}

/* if an error occurs while decoding it will be reported to the delegate. */
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error{
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
    
    if ([self.delegate respondsToSelector:@selector(musicPlayerDecodeErrorDidOccur:error:playerName:)]) {
        [self.delegate musicPlayerDecodeErrorDidOccur:self error:error playerName:self.playerName];
    }
}

- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
	// perform any interruption handling here
    CPLogInfo(@"audioPlayerBeginInterruption");

}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player
{
	// resume playback at the end of the interruption
    CPLogInfo(@"audioPlayerEndInterruption");
	//[self.audioPlayer play];

}


@end
