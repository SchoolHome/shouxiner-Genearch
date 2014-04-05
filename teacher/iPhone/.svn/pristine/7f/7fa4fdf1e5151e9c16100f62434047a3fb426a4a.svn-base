//
//  FXMobilePanel.m
//  iCouple
//
//  Created by lixiaosong on 12-3-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXMobilePanel.h"
#import "ColorUtil.h"
@implementation FXMobilePanel
@synthesize info_label_left = _info_label_left;
@synthesize info_label_number = _info_label_number;
@synthesize info_label_right = _info_label_right;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CGSize size = frame.size;
        CGFloat width = size.width;
        CGFloat height = size.height;
        CGFloat end_width = width/3;
        /*
        CGPoint origin = frame.origin;
        CGFloat origin_x = origin.x;
        CGFloat origin_y = origin.y;
        */
        
        UILabel * info_label_left_temp = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width/3, height)];
        [info_label_left_temp setBackgroundColor:[UIColor clearColor]];
        [info_label_left_temp setTextColor:[UIColor blackColor]];
        [info_label_left_temp setTextAlignment:UITextAlignmentRight];
        [info_label_left_temp setFont:[UIFont systemFontOfSize:12]];
        self.info_label_left = info_label_left_temp;
        info_label_left_temp = nil;
        
        UILabel * info_label_number_temp = [[UILabel alloc] initWithFrame:CGRectMake(end_width, 0, width/3, height)];
        [info_label_number_temp setBackgroundColor:[UIColor clearColor]];
        [info_label_number_temp setTextColor:[UIColor colorWithHexString:@"EA5234"]];
        [info_label_number_temp setTextAlignment:UITextAlignmentCenter];
        [info_label_number_temp setFont:[UIFont systemFontOfSize:12]];
        self.info_label_number = info_label_number_temp;
        info_label_number_temp = nil;
        
        UILabel * info_label_right_temp = [[UILabel alloc] initWithFrame:CGRectMake(end_width*2, 0, width/3, height)];
        [info_label_right_temp setBackgroundColor:[UIColor clearColor]];
        [info_label_right_temp setTextColor:[UIColor blackColor]];
        [info_label_right_temp setTextAlignment:UITextAlignmentLeft];
        [info_label_right_temp setFont:[UIFont systemFontOfSize:12]];
        self.info_label_right = info_label_right_temp;
        info_label_right_temp = nil;
        
        [self addSubview:self.info_label_left];
        [self addSubview:self.info_label_number];
        [self addSubview:self.info_label_right];
        
    }
    return self;
}
- (void)do_set_mobile_string:(NSString *)mobile_string{
    [self.info_label_number setText:mobile_string];
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
