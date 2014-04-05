//
//  LoadingView.m
//  iCouple
//
//  Created by shuo wang on 12-5-17.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#define ANIMATION_TIME 0.2f

#import "LoadingView.h"
#import "HPStatusBarTipView.h"
@interface LoadingView ()

@property (nonatomic,strong) UILabel *messageLabel;
@property (nonatomic,strong) UIFont *messageTextFont;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,strong) UIActivityIndicatorView *loadView;
@property (nonatomic,strong) UIImageView *completeImageView;
-(void) initLoadingView : (NSString *) messageString;
-(void) loadingViewTimeOut;
@end

@implementation LoadingView
@synthesize messageString = _messageString;
@synthesize messageLabel = _messageLabel;
@synthesize messageTextFont = _messageTextFont;
@synthesize imageView = _imageView;
@synthesize delegate = _delegate;
@synthesize timer = _timer;
@synthesize isClose = _isClose;
@synthesize image = _image;
@synthesize loadView = _loadView;
@synthesize completeImageView = _completeImageView;

-(id) initWithMessageString:(NSString *)messageString withTimeOut:(NSTimeInterval)timeOut{
    self = [super init];
    
    if (self) {
        [self initLoadingView:messageString];
        float time = timeOut;
        if (timeOut <= 0.0 || timeOut >= 600.0) {
            time = 20.0;
        }
        [self performSelector:@selector(loadingViewTimeOut) withObject:nil afterDelay:time];
//        self.timer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(loadingViewTimeOut) userInfo:nil repeats:NO];
    }
    
    return self;
}

-(id) initWithMessageString : (NSString *) messageString{
    self = [super init];
    if (self) {
        [self initLoadingView:messageString];
    }
    return self;
}

-(void) initLoadingView : (NSString *) messageString{
    self.messageTextFont = [UIFont systemFontOfSize:12.0f];
    self.isClose = NO;
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.userInteractionEnabled = YES;
    UIImage *bgImage = [UIImage imageNamed:@"float_im_magicdownload.png"];
    bgImage = [bgImage stretchableImageWithLeftCapWidth:25 topCapHeight:25];
    self.imageView.image = bgImage;
    
    self.messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.messageLabel.backgroundColor = [UIColor clearColor];
    self.messageLabel.textColor = [UIColor whiteColor];
    self.messageLabel.font = self.messageTextFont;
    self.messageLabel.numberOfLines = 0;
    self.messageString = messageString;
    self.messageLabel.textAlignment = UITextAlignmentCenter;
    CGSize size = [messageString sizeWithFont:self.messageTextFont constrainedToSize:CGSizeMake(96.5, MAXFLOAT)];
    self.messageLabel.frame = CGRectMake( 11.0f, 22.5f, 96.5, size.height);
    

    
    self.loadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.loadView.frame = CGRectMake( (118.5f - 16.0f ) / 2.0f, 
                                self.messageLabel.frame.origin.y + self.messageLabel.frame.size.height + 14.0f,
                                16.0f, 16.0f);
    [self.loadView startAnimating];

    self.completeImageView = [[UIImageView alloc] initWithFrame:self.loadView.frame];
    self.completeImageView.hidden = YES;
    
    self.frame = CGRectMake(0.0f, 0.0f, 320.0f, 480.0f);
    float height = 22.5f + self.messageLabel.frame.size.height + 14.0f + 16.0f + 20.0f;
    self.imageView.frame = CGRectMake((320.0f - 118.5) / 2.0f, (480.0f - height) / 2.0f , 118.5, height);
    
    [self.imageView addSubview:self.messageLabel];
    [self.imageView addSubview:self.loadView];
    [self.imageView addSubview:self.completeImageView];
    
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.imageView];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}


-(void) setMessageString:(NSString *)messageString{
    if ( nil == messageString || [self.messageLabel.text isEqualToString:messageString]) {
        return;
    }else {
        self.messageLabel.text = messageString;
    }
}

-(void) setImage:(UIImage *)image{
    if (nil == image) {
        [self.loadView removeFromSuperview];
        return;
    }else {
        [self.loadView removeFromSuperview];
        self.completeImageView.image = image;
        self.completeImageView.hidden = NO;
    }
}

-(void) close{
        //2012.9.24 By zq 关闭菊花的地方显示右上角提示
    [[HPStatusBarTipView shareInstance] setHidden:NO];
    if (self.isClose) {
        return;
    }
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(update) object:nil];
    self.isClose = YES;
    [UIImageView beginAnimations:@"close" context:nil];
    [UIImageView setAnimationDelay:ANIMATION_TIME];
    [UIImageView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    // 动画的结束回调，回调方法内
    [UIImageView setAnimationDelegate:self];
    [UIImageView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    [self.imageView setAlpha:0.0f];
    
    [UIImageView commitAnimations];
}

// timeout超时
-(void) loadingViewTimeOut{
//    if (nil != self.timer) {
//        [self.timer invalidate];
//        self.timer = nil;
//        
//        
//    }
    if (self.isClose) {
        return;
    }
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(update) object:nil];
    if ([self.delegate respondsToSelector:@selector(timeOut)]) {
        [self.delegate timeOut];
    }
    
    [self close];
}

// 动画的结束回调，回调方法内
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    if ([animationID isEqualToString:@"close"]) {
        [self removeFromSuperview];
    }
}

@end
