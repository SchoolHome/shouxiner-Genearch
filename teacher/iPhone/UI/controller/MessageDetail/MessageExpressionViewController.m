//
//  MessageExpressionViewController.m
//  iCouple
//
//  Created by shuo wang on 12-5-19.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "MessageExpressionViewController.h"
#import "CPUIModelManagement.h"
#import "CPUIModelPetMagicAnim.h"
#import "CPUIModelPetFeelingAnim.h"

@interface MessageExpressionViewController ()

@end

@implementation MessageExpressionViewController
@synthesize petResID = _petResID , soundPath = _soundPath;
@synthesize animView = _animView , alphaView = _alphaView;
@synthesize viewSize = _viewSize;
@synthesize isSoundFinished = _isSoundFinished , isAnimationFinished = _isAnimationFinished;
@synthesize petID = _petID;
@synthesize exModel = _exModel;
@synthesize delegate = _delegate;
@synthesize closeButton = _closeButton;
@synthesize buttonView = _buttonView;

// 初始化魔法表情系列
-(id) initWithPetResID : (NSString *) petResID withPetID : (NSString *) petID{
    self = [super init];
    
    if (self) {
        self.petResID = petResID;
        self.petID = petID;
        self.isSoundFinished = NO;
        self.isAnimationFinished = NO;
    }
    
    return self;
}

// 初始化传情系列
-(id) initWithPetResID : (NSString *) petResID withPetID : (NSString *) petID withSoundPath : (NSString *) soundPath{
    self = [super init];
    
    if (self) {
        self.petResID = petResID;
        self.petID = petID;
        self.soundPath = soundPath;
        self.isSoundFinished = NO;
        self.isAnimationFinished = NO;
    }
    
    return self;
}

-(id) initWithExModel:(ExMessageModel *)exModel{
    self = [super init];
    
    if (self) {
        self.exModel = exModel;
        self.petResID = @"shuohua";
        self.petID = exModel.messageModel.petMsgID;
        self.isSoundFinished = NO;
        self.isAnimationFinished = NO;
    }
    
    return self;
}

// 播放声音
-(void) playmusic : (NSString *) musicPath withMusicName : (NSString *) musicName{
//    [[MusicPlayerManager sharedInstance] playSound:soundPath];
    [[MusicPlayerManager sharedInstance] playMusic:musicPath playerName:musicName];
//    [[AudioPlayerManager sharedManager] playBackgroundMusic:musicPath loop:NO];
}

// 停止声音
-(void) stopMusic{
//    [[AudioPlayerManager sharedManager] stopBackgroundMusic];
    [[MusicPlayerManager sharedInstance] stop];
}

-(ALuint) playEffect:(NSString *)effectPath{
    [[SimpleAudioEngine sharedEngine] preloadEffect:effectPath];
    return [[SimpleAudioEngine sharedEngine] playEffect:effectPath];
}

-(void) stopEffect : (ALuint) i{
    [[SimpleAudioEngine sharedEngine] stopEffect:i];
}

// 界面初始化
-(void) viewDidLoad{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [[HPStatusBarTipView shareInstance] setHidden:YES];
}

// 设置view大小
-(void) setViewSize:(CGSize)viewSize{
    [self.view setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
    self.view.backgroundColor = [UIColor clearColor];
    self.view.userInteractionEnabled = YES;
    if (nil == self.alphaView) {
        self.alphaView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
        self.alphaView.backgroundColor = [UIColor blackColor];
        self.alphaView.alpha = 0.78f;
        [self.view addSubview:self.alphaView];
    }
    
    if (nil == self.animView) {
        self.animView = [[AnimImageView alloc] initWithFrame:CGRectMake((320.0f - viewSize.width) / 2.0f, (480.0f - viewSize.height) / 2.0f, viewSize.width, viewSize.height)];
        self.animView.delegate = self;
        [self.view addSubview:self.animView];
    }else {
        self.animView = [[AnimImageView alloc] initWithFrame:CGRectMake((320.0f - viewSize.width) / 2.0f, (480.0f - viewSize.height) / 2.0f, viewSize.width, viewSize.height)];
    }
    
    self.buttonView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
    [self.view addSubview:self.buttonView];
    
    self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *close = [UIImage imageNamed:@"btn_xx_pet.png"];
    UIImage *closePress = [UIImage imageNamed:@"btn_xxpress_pet.png"];
    self.closeButton.frame = CGRectMake(252.5f, 25.0f, close.size.width, close.size.height);
    [self.closeButton setImage:close forState:UIControlStateNormal];
    [self.closeButton setImage:closePress forState:UIControlStateHighlighted];
//    [self.closeButton setImageEdgeInsets:UIEdgeInsetsMake(25.0f, 0.0f, 0.0f, 0.0f)];
    [self.closeButton addTarget:self action:@selector(closeAnimationView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closeButton];
}

-(void) closeAnimationView{
    if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
        [self.delegate closeMessageExpressionView];
    }
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if ([self.delegate respondsToSelector:@selector(closeMessageExpressionView)]) {
        [self.delegate closeMessageExpressionView];
    }
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

// 动画开始的回调
-(void)animImageViewDidStartAnim:(AnimImageView*) animView{
}

// 动画停止的回调
-(void)animImageViewDidStopAnim:(AnimImageView*) animView{
    self.isAnimationFinished = YES;
}

-(void)musicPlayer:(MusicPlayerManager *) player playToTime:(NSTimeInterval) time playerName:(NSString *)name{
    
}

-(void) audioPlayerDidFinishPlaying{
    self.isSoundFinished = YES;
}

-(void)musicPlayerDidFinishPlaying:(MusicPlayerManager *) player playerName:(NSString *)name{
    [self audioPlayerDidFinishPlaying];
//    self.isSoundFinished = YES;
}

-(void)musicPlayerDecodeErrorDidOccur:(MusicPlayerManager *) player error:(NSError *)error playerName:(NSString *)name{
    
}

@end
