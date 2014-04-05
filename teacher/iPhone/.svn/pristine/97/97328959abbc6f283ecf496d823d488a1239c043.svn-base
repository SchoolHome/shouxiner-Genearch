//
//  FXButtonExt.m
//  iCouple
//
//  Created by lixiaosong on 12-3-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXButtonExt.h"

@implementation FXButtonExt
@synthesize button_image_view = _button_image_view;
@synthesize button_label = _button_label;
@synthesize button = _button;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImageView * button_image_view_temp = [[UIImageView alloc] initWithFrame:frame];
        self.button_image_view = button_image_view_temp;
        button_image_view_temp = nil;
        
        UILabel * button_label_temp = [[UILabel alloc] initWithFrame:frame];
        self.button_label = button_label_temp;
        button_label_temp = nil;
        
        UIButton * button_temp = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button = button_temp;
        button_temp = nil;
    }
    return self;
}
- (void)do_set_string_nomal_string:(NSString *)normal_string highlight_string:(NSString *)highlight_string{
    
}
- (void)do_set_image_normal_image:(UIImage *)normal_image highlight_image:(UIImage *)highlight_image{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
