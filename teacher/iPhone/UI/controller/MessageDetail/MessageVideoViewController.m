//
//  MessageVideoViewController.m
//  iCouple
//
//  Created by shuo wang on 12-5-11.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

// 视频的延迟展现时间
#define VIDEO_DELAY_TIME 0.2f
// 播放动画的时间
#define ANIMATION_TIME 0.4f

#import "MessageVideoViewController.h"
#import "CustomAlertView.h"

@interface MessageVideoViewController ()
// 视频的本地url
@property (nonatomic,strong) NSURL *videoURL;
// 保存视频按钮
@property (nonatomic,strong) UIButton *saveVideoButton;
@property (nonatomic,strong) MPMoviePlayerController *moviePlayer;
@property (nonatomic) BOOL isMoved;
// 播放按钮
@property (nonatomic,strong) UIButton *playButton;
// 用户是否加载了播放按钮
@property (nonatomic) BOOL isShowPlayButton;
// 保存浮层
@property (nonatomic,strong) LoadingView *loadingView;

@property (nonatomic) BOOL isPlaying;
/**********************临时增加***************************/
@property (nonatomic) BOOL isSaveing;
/**********************临时增加***************************/

/**********************优化速度增加***************************/
@property (nonatomic,strong) UIImageView *videoImageView;
@property (nonatomic) BOOL isMoviePlayerLoadCompleted;
@property (nonatomic) BOOL isImageViewAnimationCompleted;
/**********************优化速度增加***************************/

// 播放视频
-(void) playVideo;
// 播放视频结束回调
-(void) playerPlaybackDidFinish:(NSNotification*)notification;

// 保存视频方法
-(void) saveVideoToLocation;
// 关闭视频View
-(void) closeVideoView;
// 关闭视频显示动画
-(void) closeImageViewAnimation;
@end

@implementation MessageVideoViewController
@synthesize imageView = _imageView , imagePath = _imagePath , videoPath = _videoPath , videoRect = _videoRect;
@synthesize isSavedImage = _isSavedImage , isBeganShowAnimation = _isBeganShowAnimation , isEndCloseAnimation = _isEndCloseAnimation;
@synthesize saveVideoButton = _saveVideoButton;
@synthesize delegate = _delegate , moviePlayer = _moviePlayer , isMoved = _isMoved;
@synthesize videoURL = _videoURL;
@synthesize isSaveing = _isSaveing , loadingView = _loadingView;
@synthesize isShowPlayButton = _isShowPlayButton , playButton = _playButton;
@synthesize isPlaying = _isPlaying , videoImageView = _videoImageView;
@synthesize isImageViewAnimationCompleted = _isImageViewAnimationCompleted , isMoviePlayerLoadCompleted = _isMoviePlayerLoadCompleted;

-(id) initWithVideoPath : (NSString *) videoPath withImagePath : (NSString *)imagePath withRect : (CGRect) rect{
    if (self = [super init]) {
        self.videoPath = videoPath;
        self.imagePath = imagePath;
        self.videoRect = rect;
        self.isPlaying = NO;
        CPLogInfo(@"－－－－－－－－－－视频的路径：%@",self.videoPath);
        CPLogInfo(@"－－－－－－－－－－第一桢的路径：%@",self.imagePath);
        
        self.isSavedImage = NO;
        self.isBeganShowAnimation = YES;
        self.isEndCloseAnimation = NO;
        self.isMoved = NO;
        self.isSaveing = NO;
        self.isShowPlayButton = NO;
        self.isMoviePlayerLoadCompleted = NO;
        self.isImageViewAnimationCompleted = NO;
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    // 增加手势，，当长按时，触发保存视频事件
    UILongPressGestureRecognizer *longPressRecognizer;
    longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(saveVideoToLocationActionSheet:)];
    
    self.videoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 0.0f, 0.0f)];
    self.videoImageView.image = [UIImage imageWithContentsOfFile:self.imagePath];
    self.videoImageView.frame = self.videoRect;
    [self.view addSubview:self.videoImageView];
    [self beginAnimation];
    
    // 本地的视频URL
    self.videoURL = [NSURL fileURLWithPath:self.videoPath];

    // 显示视频
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:self.videoURL];
//    self.moviePlayer.view.frame = self.videoRect;
    self.moviePlayer.view.frame = CGRectMake(0.0f, 0.0f, 320.0f, 480.0f);
    if (self.videoRect.size.width < self.videoRect.size.height) {
        [self.moviePlayer setScalingMode:MPMovieScalingModeFill];
    }
    
	self.moviePlayer.useApplicationAudioSession = NO; 
    self.moviePlayer.controlStyle = MPMovieControlStyleNone;
    self.moviePlayer.shouldAutoplay = NO;
    self.moviePlayer.initialPlaybackTime = 0.01f;
    self.moviePlayer.view.backgroundColor = [UIColor clearColor];
    [self.moviePlayer.view addGestureRecognizer:longPressRecognizer];
    self.moviePlayer.view.hidden = YES;
    [self.view addSubview:self.moviePlayer.view];
    [self.moviePlayer setFullscreen:YES animated:NO];
    // 添加视频播放结束监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerPlaybackDidFinish:)
                                          name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    // 添加视频加载完成的监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayerLoadStateChanged:)
                                                 name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void) moviePlayerLoadStateChanged:(NSNotification*)notification {
    if ([self.moviePlayer loadState] != MPMovieLoadStateUnknown){
        // 移除观察者
        [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
//        [NSTimer scheduledTimerWithTimeInterval:VIDEO_DELAY_TIME target:self selector:@selector(beginAnimation) userInfo:nil repeats:NO];
        if (self.isImageViewAnimationCompleted) {
            [self.videoImageView removeFromSuperview];
            [self playVideo];
        }else{
            self.isMoviePlayerLoadCompleted = YES;
        }
    }
}

-(void) beginAnimation{
//    self.moviePlayer.view.hidden = NO;
    [[HPStatusBarTipView shareInstance] setHidden:YES];
    // 调用外层view处理关闭动画
    if ([self.delegate respondsToSelector:@selector(beganOpenVideoAnimation)]) {
        [self.delegate beganOpenVideoAnimation];
    }
    
    float width = 320.0f;
    float height = 480.0f;
    float y = 0.0f;
    if (self.videoRect.size.width >= self.videoRect.size.height) {
        float scale = 320.0f / self.videoRect.size.width;
        width = 320.0f;
        height = self.videoRect.size.height * scale + 24.0f;
        y = (480.0f - height) / 2.0f;
    }
    
    // uiview动画
    [UIView beginAnimations:@"VideoBegin" context:nil];
    [UIView setAnimationDuration:ANIMATION_TIME];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    // 动画的结束回调，回调方法内，增加下载按钮
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
//    self.moviePlayer.view.frame = CGRectMake(0.0f, 0.0f, 320.0f, 480.0f);
//    self.view.backgroundColor = [UIColor clearColor];
//    self.view.backgroundColor = [UIColor blackColor];
    self.videoImageView.frame = CGRectMake(0.0f, y, width, height);
    self.view.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor blackColor];
    
    [UIView commitAnimations];
}

// 动画的结束回调，回调方法内，增加下载按钮
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    if ([animationID isEqualToString:@"VideoBegin"]) {
        
        // 增加下载按钮
        self.saveVideoButton = [[UIButton alloc] initWithFrame:CGRectMake((320.0f-36.0f) / 2.0f, (480.0f - 36.0f - 15.0f), 36.0f, 36.0f)];
        [self.saveVideoButton setBackgroundImage:[UIImage imageNamed:@"btn_video_download.png"] forState:UIControlStateNormal];
        [self.saveVideoButton setBackgroundImage:[UIImage imageNamed:@"btn_video_downloadpress.png"] forState:UIControlStateHighlighted];
        // 添加保存视频的点击事件
        [self.saveVideoButton addTarget:self action:@selector(saveVideoToLocation) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.saveVideoButton];
        self.isBeganShowAnimation = NO;
//        [self playVideo];
        if (self.isMoviePlayerLoadCompleted) {
            [self.videoImageView removeFromSuperview];
            [self playVideo];
        }else{
            self.isImageViewAnimationCompleted = YES;
        }
        
    }else {
        [self.moviePlayer.view removeFromSuperview];
        [self.view removeFromSuperview];
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        // 调用外层view处理关闭动画
        if ([self.delegate respondsToSelector:@selector(endCloseVideoAnimation)]) {
            [self.delegate endCloseVideoAnimation];
        }
    }
}

// 长按时，保存视频到本地
-(void) saveVideoToLocationActionSheet : (UIGestureRecognizer *) press{
    if (press.state != UIGestureRecognizerStateBegan) {  
        return;  
    }
    // 如果视频已经保存过返回
    if (self.isSavedImage) {
        return;
    }
    
    NSMutableArray *saveImage = [[NSMutableArray alloc] initWithCapacity:2];
    [saveImage addObject:@"保存视频到本地"];
    
    UIActionSheet *saveSheet = [[UIActionSheet alloc] initWithTitle:@"" 
                                                           delegate:self 
                                                  cancelButtonTitle:nil 
                                             destructiveButtonTitle:nil 
                                                  otherButtonTitles:nil, 
                                nil];
    for (NSString *str in saveImage) {
        [saveSheet addButtonWithTitle:str];
    }
    
    [saveSheet addButtonWithTitle:@"取消"];
    saveSheet.destructiveButtonIndex = saveSheet.numberOfButtons - 1;
    [saveSheet showFromRect:self.view.bounds inView:self.view animated:YES];
}

// ActionSheet的回调方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    // 如果是点击了取消按钮，则返回
    if (buttonIndex == actionSheet.destructiveButtonIndex) {
        return;
    }else {
        [self saveVideoToLocation];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        NSArray *array = touch.gestureRecognizers;
        for (UIGestureRecognizer *gesture in array) {
            if (gesture.enabled && [gesture isMemberOfClass:[UIPinchGestureRecognizer class]]) {
                gesture.enabled = NO;
            }
        }
    }
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    self.isMoved = YES;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (self.isMoved) {
        self.isMoved = NO;
        return;
    }
    [self closeVideoView];
}

// 点击时，展示关闭动画
-(void) closeVideoView{
    if (self.isBeganShowAnimation) {
        return;
    }
    if (self.isEndCloseAnimation) {
        return;
    }
    
    if (self.isSaveing) {
        UIAlertView *alert;
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"正在保存..." delegate:nil cancelButtonTitle:@"OK." otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    self.isEndCloseAnimation = YES;
    [self.saveVideoButton removeFromSuperview];
    
    if (nil == self.playButton) {
        [self.playButton removeFromSuperview];
    }
    [self closeImageViewAnimation];
}

// 关闭图片显示动画
-(void) closeImageViewAnimation{
    
    // 调用外层view处理关闭动画
    if ([self.delegate respondsToSelector:@selector(beganCloseVideoAnimation)]) {
        [self.delegate beganCloseVideoAnimation];
    }
    [self.playButton removeFromSuperview];
    [self.moviePlayer pause];
    
    CGRect rect = [self.view convertRect:self.videoRect toView:nil];
    
    // uiview动画
    [UIView beginAnimations:@"VideoClose" context:nil];
    [UIView setAnimationDuration:ANIMATION_TIME];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    // 动画的结束回调，回调方法内，增加下载按钮
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    self.moviePlayer.view.frame = rect;
    self.view.backgroundColor = [UIColor clearColor];
    
    [UIView commitAnimations];
}

-(void) playVideo{
    if (self.isShowPlayButton) {
        self.playButton.hidden = YES;
    }
    self.moviePlayer.view.hidden = NO;
    self.isPlaying = YES;
    [self.moviePlayer prepareToPlay];
    [self.moviePlayer play];
}

-(void) playerPlaybackDidFinish:(NSNotification*)notification{
    
    if (self.isShowPlayButton) {
        self.isPlaying = NO;
        self.playButton.hidden = NO;
        return;
    }
    
    
    self.isPlaying = NO;
    self.isShowPlayButton = YES;
    self.playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playButton setBackgroundImage:[UIImage imageNamed:@"btn_video_play.png"] forState:UIControlStateNormal];
    [self.playButton setBackgroundImage:[UIImage imageNamed:@"btn_play_talkpress.png"] forState:UIControlStateHighlighted];
    self.playButton.frame = CGRectMake((320.0f - 50.0f) / 2.0f, (480.0f - 50.0f) / 2.0f, 50.0f, 50.0f);
    [self.playButton addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playButton];
}

// 保存视频到本地
-(void) saveVideoToLocation{
    CustomAlertView *custom = [[CustomAlertView alloc] init];
    self.loadingView = [custom showLoadingMessageBox:@"正在保存..."];
    
    self.isSaveing = YES;
    
    if (self.isPlaying) {
        [self.moviePlayer pause];
    }
    
    UISaveVideoAtPathToSavedPhotosAlbum(self.videoPath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
}

//保存视频完成的回调
-(void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *loadingString = @"";
    if (error == nil){
        // 成功保存视频
        loadingString = @"保存成功";
    }
    else{
        // 保存视频失败
        loadingString = @"保存失败";
    }
//    NSLog(@"%@",error.description);
    
    
    [self.loadingView setMessageString:loadingString];
    
    if (error == nil) {
        UIImage *image = [UIImage imageNamed:@"right_arrow.png"];
        [self.loadingView setImage:image];
    }else {
        [self.loadingView setImage:nil];
    }
    
    [self.loadingView close];
    self.isSaveing = NO;
    if (self.isPlaying) {
        [self.moviePlayer play];
    }
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
