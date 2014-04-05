//
//  SystemProfileView.m
//  iCouple
//
//  Created by qing zhang on 7/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SystemProfileView.h"

@implementation SystemProfileView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self.imageviewBGInMainView setImage:[UIImage imageNamed:@"pic_system.jpg"]];
        
        self.buttonView.hidden = YES;
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320.f, 230.f)];
        [imageview setImage:[UIImage imageNamed:@"bg_im_system.png"]];
        [self.viewContentBG addSubview:imageview];
        
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

@end
