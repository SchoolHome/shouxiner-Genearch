//
//  MessageSoundPlayer.m
//  iCouple
//
//  Created by shuo wang on 12-5-23.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "MessageSoundPlayer.h"
#import "ExMessageModel.h"
#import "TPCMToAMR.h"
#import "MusicPlayerManager.h"
@interface MessageSoundPlayer ()

@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) ExMessageModel *exModel;
@property (nonatomic,strong) NSThread *thread;
@property (nonatomic) BOOL isStop;
@property (nonatomic) float sec;
-(void) getSoundTime;
@end

@implementation MessageSoundPlayer
@synthesize soundCell = _soundCell;
@synthesize timer = _timer;
@synthesize exModel = _exModel;
@synthesize thread = _thread;
@synthesize isStop = _isStop;
@synthesize sec = _sec;

static MessageSoundPlayer *messageSoundPlayer = nil;

+(MessageSoundPlayer *) sharedInstance{
    if ( nil == messageSoundPlayer) {
        messageSoundPlayer = [[MessageSoundPlayer alloc] init];
    }
    return messageSoundPlayer;
}

-(void) playSound:(SingleSoundCell *)cell{
    [self stopSound];
    self.soundCell = cell;
    [AudioPlayerManager sharedManager].delegate = self;
    self.exModel = (ExMessageModel *)cell.data;
        
    NSString *pcmPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"] stringByAppendingPathComponent:@"1.wav"]; 
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:pcmPath]) {
        [fileManager removeItemAtPath:pcmPath error:nil];
        pcmPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"] stringByAppendingPathComponent:@"2.wav"];
    }
    
    int succeed = [TPCMToAMR doConvertAMRFromPath:self.exModel.messageModel.filePath toPCMPath:pcmPath];
    // 返回值如果小于零，则转换不成功，不做任何操作
    if (succeed <= 0) {
        CPLogInfo(@"音频文件转换不成功，amr文件为：%@",self.exModel.messageModel.filePath);
        return;
    }
    
    // 更改声音状态
    if ([self.exModel.messageModel.sendState intValue] != MSG_SEND_STATE_AUDIO_READED) {
        [[CPUIModelManagement sharedInstance] markMsgAudioReadedWithMsg:self.exModel.messageModel];
    }
    
//    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    self.exModel.isPlaySound = YES;
    [cell refreshPlayStatus:YES];
    [[AudioPlayerManager sharedManager] preloadBackgroundMusic:pcmPath];
    [[AudioPlayerManager sharedManager] playBackgroundMusic:pcmPath loop:NO];
    
    self.sec = 0.0f;
    self.isStop = NO;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(getSoundTime) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void) audioPlayerDidFinishPlaying{
    CPLogInfo(@"audioPlayerDidFinishPlaying");
    CFRunLoopStop([[NSRunLoop currentRunLoop] getCFRunLoop]);
    [self stopSound];
}

-(void) getSoundTime{
    
    float time = [self.exModel.messageModel.mediaTime floatValue];
    float currentTime = [[[SimpleAudioEngine sharedEngine] getCDAudioManager] backgroundMusic].audioSourcePlayer.currentTime;

//    if (currentTime > 0.01f && currentTime < 0.15f) {
//        if (self.isStop) {
//            NSLog(@"getSoundTime is shutdown Playing!!!!!!");
//            CFRunLoopStop([[NSRunLoop currentRunLoop] getCFRunLoop]);
//            [self stopSound];
//            return;
//        }else {
//            self.isStop = YES;
//        }
//    }
    
    self.sec += 0.1;
    if (self.sec - time > 0.9f) {
        CPLogInfo(@"getSoundTime is shutdown Playing!!!!!!");
        CFRunLoopStop([[NSRunLoop currentRunLoop] getCFRunLoop]);
        [self stopSound];
        return;
    }
    
//    NSLog(@"messageModel.mediaTime : %.1f",time);
//    NSLog(@"audioSourcePlayer.currentTime : %.1f",currentTime);
    [self.soundCell updatePlayTime:time - currentTime ];
}

-(void) stopSound{
    if (nil != self.timer) {
        [self.timer invalidate];
        self.timer = nil;
        [[AudioPlayerManager sharedManager] stopBackgroundMusic];
        if ([[MusicPlayerManager sharedInstance] isPlaying]) {
            [[MusicPlayerManager sharedInstance] stop];
        }
    }
//    [[AudioPlayerManager sharedManager] stopBackgroundMusic];
    self.isStop = NO;
    self.sec = 0.0f;
    if( nil != self.soundCell){
        self.exModel = (ExMessageModel *)self.soundCell.data;
        self.exModel.isPlaySound = NO;
        [self.soundCell playCompleted];
        [self.soundCell refreshPlayStatus:NO];
    }
}

@end
