//
//  FXInputAlert.m
//  iCouple
//
//  Created by lixiaosong on 12-3-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXInputAlert.h"
#import "FanxerHeader.h"
@implementation FXInputAlert
@synthesize alert_image_view = _alert_image_view;
@synthesize alert_info_label = _alert_info_label;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView * alert_image_view_temp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
        [alert_image_view_temp setImage:[UIImage imageNamed:FX_SHAKE_FIELD_ALERT]];
        self.alert_image_view = alert_image_view_temp;
        alert_image_view_temp = nil;
        
        UILabel * alert_info_label_temp = [[UILabel alloc] initWithFrame:CGRectMake(17, 0, 100, 17)];
        [alert_info_label_temp setFont:[UIFont systemFontOfSize:12]];
        self.alert_info_label = alert_info_label_temp;
        alert_info_label_temp = nil;
        
        [self addSubview:self.alert_image_view];
        [self addSubview:self.alert_info_label];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)do_set_alert_image:(UIImage *)alert_image{
    [self.alert_image_view setImage:alert_image];
}
- (void)do_set_alert_info_font:(UIFont *)alert_info_font{
    [self.alert_info_label setFont:alert_info_font];
}
- (void)do_set_alert_info_ground_color:(UIColor *)alert_info_ground_color{
    [self.alert_info_label setBackgroundColor:alert_info_ground_color];
}
- (void)do_set_alert_info_text_color:(UIColor *)alert_info_text_color{
    [self.alert_info_label setTextColor:alert_info_text_color];
}
- (void)do_set_alert_info_string:(NSString *)alert_info_string{
    [self.alert_info_label setText:alert_info_string];
}
@end
