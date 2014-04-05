//
//  MessagePetViewController.m
//  iCouple
//
//  Created by shuo wang on 12-5-15.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "MessagePetViewController.h"
#import "CPUIModelManagement.h"
#import "CPUIModelPetMagicAnim.h"
#import "MusicPlayerManager.h"

@interface MessagePetViewController ()
@property (nonatomic) ALuint effectCount;
@property (nonatomic,strong) CPUIModelAudioSlideInfo *info;
@end

@implementation MessagePetViewController
@synthesize effectCount = _effectCount;
@synthesize info = _info;

// 播放声音
-(void)play:(CPUIModelAudioSlideInfo *)info{
//    [[MusicPlayerManager sharedInstance] playSound:info.fileName];
    
//    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    [self playmusic:info.fileName withMusicName:self.petResID];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    CPUIModelPetMagicAnim *magic = [[CPUIModelManagement sharedInstance] magicObjectOfID:self.petResID fromPet:self.petID];
    
    CGSize size = CGSizeMake([magic.width floatValue] / 2.0f, [magic.height floatValue] / 2.0f);
    self.viewSize = size;
    
    [MusicPlayerManager sharedInstance].delegate = self;
    
    [self.animView addAnimArray:[magic allAnimSlides] forName:self.petResID];    
    
    if ([[magic allAudioSlide] count]>0) {
        self.info = [[magic allAudioSlide] objectAtIndex:0];
        [self performSelector:@selector(play:) withObject:self.info afterDelay:[self.info.startTime floatValue]/1000.0f];
    }
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

-(void) closeAnimationView{
    [super closeAnimationView];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(play:) object:self.info];
    [self.animView stop];
//    [self stopEffect:self.effectCount];
    [self stopMusic];
//    [[MusicPlayerManager sharedInstance] stop];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.view removeFromSuperview];
}

-(void)animImageViewDidStopAnim:(AnimImageView*) animView{
    [super animImageViewDidStopAnim:animView];
    [self.animView stop];
//    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(play:) object:nil];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[HPStatusBarTipView shareInstance] setHidden:NO];
    if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
        [self.delegate closeMessageExpressionView];
    }
    [self.view removeFromSuperview];
}

@end
