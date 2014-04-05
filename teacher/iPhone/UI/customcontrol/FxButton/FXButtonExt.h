//
//  FXButtonExt.h
//  iCouple
//
//  Created by lixiaosong on 12-3-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FXButtonExt : UIView
@property (nonatomic, retain) UIImageView * button_image_view;
@property (nonatomic, retain) UILabel * button_label;
@property (nonatomic, retain) UIButton * button;
- (void)do_set_string_nomal_string:(NSString *)normal_string highlight_string:(NSString *)highlight_string;
- (void)do_set_image_normal_image:(UIImage *)normal_image highlight_image:(UIImage *)highlight_image;
@end
