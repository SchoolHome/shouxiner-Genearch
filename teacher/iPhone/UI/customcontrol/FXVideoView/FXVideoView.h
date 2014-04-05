//
//  FXVideoView.h
//  iCouple
//
//  Created by lixiaosong on 12-3-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FXVideoView : UIView
@property (nonatomic, retain) UIWebView * video_view;
@property (nonatomic, strong) UIImageView * background_view;
@property (nonatomic, strong) UIButton * play_button;
- (void)do_set_background_image:(UIImage *)background_image;
- (void)do_load_video_url_string:(NSString *)url_string;
@end
