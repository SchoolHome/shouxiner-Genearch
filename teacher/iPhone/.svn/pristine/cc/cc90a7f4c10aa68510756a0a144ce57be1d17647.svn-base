//
//  FXVideoView.m
//  iCouple
//
//  Created by lixiaosong on 12-3-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#define FX_VIDEO_VIEW_BUTTON_X 214/2
#define FX_VIDEO_VIEW_BUTTON_Y 126/2
#define FX_VIDEO_VIEW_BUTTON_W 117/2
#define FX_VIDEO_VIEW_BUTTON_H 115/2
#import "FXVideoView.h"
#import "FanxerHeader.h"
@implementation FXVideoView
@synthesize video_view = _video_view;
@synthesize background_view = _background_view;
@synthesize play_button = _play_button;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CGSize end_size = frame.size;
        UIWebView * video_view_temp = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, end_size.width, end_size.height)];
        [video_view_temp setBackgroundColor:[UIColor clearColor]];
        self.video_view = video_view_temp;
        video_view_temp = nil;
        
        UIImageView *image_view_temp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, end_size.width, end_size.height)];
        [image_view_temp setUserInteractionEnabled:YES];
        self.background_view = image_view_temp;
        image_view_temp = nil;
        
        UIButton * play_button_temp = [UIButton buttonWithType:UIButtonTypeCustom];
        [play_button_temp setFrame:CGRectMake(FX_VIDEO_VIEW_BUTTON_X, FX_VIDEO_VIEW_BUTTON_Y, FX_VIDEO_VIEW_BUTTON_W, FX_VIDEO_VIEW_BUTTON_H)];
        [play_button_temp setImage:[UIImage imageNamed:FX_VERIFY_ICON_PLAY] forState:UIControlStateApplication];
        
        self.play_button = play_button_temp;
        play_button_temp = nil;
        
        [self.background_view addSubview:self.play_button];
        [self addSubview:self.background_view];
        //[self addSubview:self.video_view];
    }
    return self;
}
- (void)do_set_background_image:(UIImage *)background_image{
    [self.background_view setImage:background_image];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)do_load_video_url_string:(NSString *)url_string{
    NSURL * url = [NSURL URLWithString:url_string];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.video_view loadRequest:request];
}
@end
