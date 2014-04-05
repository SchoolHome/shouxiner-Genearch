//
//  MessageSoundExpressionViewController.m
//  iCouple
//
//  Created by shuo wang on 12-5-18.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "MessageSoundExpressionViewController.h"
#import "MusicPlayerManager.h"
#import "TPCMToAMR.h"

@interface MessageSoundExpressionViewController ()
@property (nonatomic,strong) NSString *pcmPath;
@property (nonatomic,strong) NSArray *imageArray;
@end

@implementation MessageSoundExpressionViewController
@synthesize pcmPath = _pcmPath;
@synthesize imageArray = _imageArray;

// 初始化传情系列
-(id) initWithPetResID : (NSString *) petResID withPetID : (NSString *) petID withSoundPath : (NSString *) soundPath{
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
        
        self.imageArray = [[NSArray alloc] initWithObjects:
                      @"shuohua01",
                      @"shuohua02",
                      @"shuohua03",
                      @"shuohua04",
                      @"shuohua05",
                      @"shuohua06",
                      @"shuohua07",
                      @"shuohua08",
                      @"shuohua09",
                      @"shuohua10",
                      @"shuohua11",
                      @"shuohua12",
                      @"shuohua13",
                      @"shuohua14",
                      @"shuohua15",
                      @"shuohua16",
                      nil];

    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    CPUIModelPetActionAnim *soundExpression = [[CPUIModelManagement sharedInstance] actionObjectOfID:self.petResID];
    CGSize size = CGSizeMake([soundExpression.width floatValue] / 2.0f, [soundExpression.height floatValue] / 2.0f);
    self.viewSize = size;
//    [AudioPlayerManager sharedManager].delegate = self;
    [MusicPlayerManager sharedInstance].delegate = self;
    
//    [self.animView addAnimArray:[soundExpression allAnimSlides] forName:self.petResID];
    
//    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    [self playmusic:self.pcmPath withMusicName:self.petResID];

}

-(void)musicPlayer:(MusicPlayerManager *) player playToTime:(NSTimeInterval) time playerName:(NSString *)name{
    
    [player.audioPlayer updateMeters];
    double avgPowerForChannel = pow(10, (0.05 * [player.audioPlayer averagePowerForChannel:0]));    
    int nIdx = (int)(avgPowerForChannel*16);
    NSLog(@"amp nIdx: %d", nIdx);
    
    [self.animView setImage:[UIImage imageNamed:[self.imageArray objectAtIndex:nIdx]]];
}


- (void)viewDidUnload{
    [super viewDidUnload];
}

// 动画播放完成回调
-(void)animImageViewDidStopAnim:(AnimImageView*) animView{
//    [super animImageViewDidStopAnim:animView];
////    [self.animView stop];
//    
//    // 如果动画完成，并且声音也完成
//    if (self.isSoundFinished) {
//        self.animView.delegate = nil;
//        [self.animView stop];
//        [[UIApplication sharedApplication] setStatusBarHidden:NO];
//        [[HPStatusBarTipView shareInstance] setHidden:NO];
//        if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
//            [self.delegate closeMessageExpressionView];
//        }
//        [self.view removeFromSuperview];
//    }else {
//        [self.animView start];
//    }
}

// 声音播放完成回调
-(void) audioPlayerDidFinishPlaying{
    [super audioPlayerDidFinishPlaying];
    
    // 如果声音完成，并且动画也完成
//    if (self.isAnimationFinished) {
        [self.animView stop];
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [[HPStatusBarTipView shareInstance] setHidden:NO];
        if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
            [self.delegate closeMessageExpressionView];
        }
        [self.view removeFromSuperview];
//    }
}

-(void) closeAnimationView{
    [super closeAnimationView];
    [self.animView stop];
    [self stopMusic];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.view removeFromSuperview];
}

@end
