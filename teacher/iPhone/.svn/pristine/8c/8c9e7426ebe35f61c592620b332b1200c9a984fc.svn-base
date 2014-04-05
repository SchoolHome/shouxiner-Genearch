//
//  OverlayGuidView.m
//  Overlay
//
//  Created by ming bright on 12-9-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OverlayGuidView.h"

@implementation OverlayGuidView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        overlayImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:overlayImageView];
        
    }
    return self;
}

-(void)setImage:(UIImage *)image_{
    overlayImageView.image = image_;
}

-(void)hide{
    [UIView animateWithDuration:0.2f animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)showInView:(UIView *)superView_{
    [self showInView:superView_ duration:2.5f];
}

-(void)showInView:(UIView *)superView_ duration:(NSTimeInterval)duration_{
    self.alpha = 0.0f;
    [superView_ addSubview:self];
    [UIView animateWithDuration:0.1f animations:^{
        self.alpha = 1.0f;
    } completion:^(BOOL finished) {
        [self performSelector:@selector(hide) withObject:nil afterDelay:duration_];
    }];
}

@end
