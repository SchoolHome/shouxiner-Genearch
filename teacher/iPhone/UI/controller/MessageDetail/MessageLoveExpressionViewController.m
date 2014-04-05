//
//  MessageLoveExpressionViewController.m
//  iCouple
//
//  Created by shuo wang on 12-5-18.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "MessageLoveExpressionViewController.h"
#import "CPUIModelManagement.h"
#import "CPUIModelPetMagicAnim.h"
#import "CPUIModelPetFeelingAnim.h"
#import "MusicPlayerManager.h"
#import "TPCMToAMR.h"

@interface MessageLoveExpressionViewController ()
@property (nonatomic,strong) NSString *pcmPath;
@end

@implementation MessageLoveExpressionViewController
@synthesize pcmPath = _pcmPath;

-(id) initWithPetResID:(NSString *)petResID withPetID:(NSString *)petID withSoundPath:(NSString *)soundPath{
    self = [super initWithPetResID:petResID withPetID:petID withSoundPath:soundPath];
    
    if (self) {
        self.pcmPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"] stringByAppendingPathComponent:@"1.wav"]; 
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:self.pcmPath]) {
            [fileManager removeItemAtPath:self.pcmPath error:nil];
            self.pcmPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"] stringByAppendingPathComponent:@"2.wav"];
        }
        
        int succeed = [TPCMToAMR doConvertAMRFromPath:self.soundPath toPCMPath:self.pcmPath];
        // 返回值如果小于零，则转换不成功，不做任何操作
        if (succeed <= 0) {
            CPLogInfo(@"音频转换不成功");
            return nil;
        }
    }
    
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];

    CPUIModelPetFeelingAnim *petFeeling = [[CPUIModelManagement sharedInstance] feelingObjectOfID:self.petResID fromPet:self.petID];
    CGSize size = CGSizeMake([petFeeling.width floatValue] / 2.0f, [petFeeling.height floatValue] / 2.0f);
    self.viewSize = size;
//    [AudioPlayerManager sharedManager].delegate = self;
    [MusicPlayerManager sharedInstance].delegate = self;
    [self.animView addAnimArray:[petFeeling allAnimSlides] forName:self.petResID];
    
//    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    [self playmusic:self.pcmPath withMusicName:self.petResID];
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

//-(void)musicPlayerDidFinishPlaying:(MusicPlayerManager *) player playerName:(NSString *)name{
//    [super audioPlayerDidFinishPlaying];
//    
//    // 如果声音完成，并且动画也完成
//    if (self.isAnimationFinished) {
//        [[UIApplication sharedApplication] setStatusBarHidden:NO];
//        [[HPStatusBarTipView shareInstance] setHidden:NO];
//        if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
//            [self.delegate closeMessageExpressionView];
//        }
//        [self.view removeFromSuperview];
//    }
//}

// 动画播放完成回调
-(void)animImageViewDidStopAnim:(AnimImageView*) animView{
    [super animImageViewDidStopAnim:animView];
    [self.animView stop];
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    [self.view removeFromSuperview];
    
    // 如果动画完成，并且声音也完成
    if (self.isSoundFinished) {
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [[HPStatusBarTipView shareInstance] setHidden:NO];
        if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
            [self.delegate closeMessageExpressionView];
        }
        [self.view removeFromSuperview];
    }
}

// 声音播放完成回调
-(void) audioPlayerDidFinishPlaying{
    [super audioPlayerDidFinishPlaying];
    
    // 如果声音完成，并且动画也完成
    if (self.isAnimationFinished) {
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [[HPStatusBarTipView shareInstance] setHidden:NO];
        if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
            [self.delegate closeMessageExpressionView];
        }
        [self.view removeFromSuperview];
    }
}

-(void) closeAnimationView{
    [super closeAnimationView];
    [self.animView stop];
    [self stopMusic];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.view removeFromSuperview];
}
//-(void) musicPlayerDidFinishPlaying:(MusicPlayerManager *)player playerName:(NSString *)name{
//    [super musicPlayerDidFinishPlaying:player playerName:name];
//    
//    // 如果声音完成，并且动画也完成
//    if (self.isAnimationFinished) {
//        [[UIApplication sharedApplication] setStatusBarHidden:NO];
//        [self.view removeFromSuperview];
//    }
//}

@end
