//
//  HomePageArrowView.m
//  iCouple
//
//  Created by ming bright on 12-6-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomePageArrowView.h"
#import <QuartzCore/QuartzCore.h>
#import "ColorUtil.h"
@implementation HomePageArrowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    UIColor *backColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
    
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: 
                                          CGRectMake(8, 0, rect.size.width-8, rect.size.height) cornerRadius: 5];
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(8, rect.size.height/2-4)];
    [bezierPath addLineToPoint: CGPointMake(0, rect.size.height/2)];
    [bezierPath addLineToPoint: CGPointMake(8, rect.size.height/2+4)];
    
    [roundedRectanglePath appendPath:bezierPath];
    [roundedRectanglePath addClip];
    [backColor setFill];
    [roundedRectanglePath fill];
    
    
    
    UIBezierPath* roundedRectanglePath1 = [UIBezierPath bezierPathWithRoundedRect: 
                                          CGRectMake(12, -1, rect.size.width-11, rect.size.height+2) cornerRadius: 5];
    
    UIBezierPath* bezierPath1 = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(15, rect.size.height/2-8)];
    [bezierPath addLineToPoint: CGPointMake(-3, rect.size.height/2)];
    [bezierPath addLineToPoint: CGPointMake(15, rect.size.height/2+8)];
    
    [roundedRectanglePath1 appendPath:bezierPath1];
    
    self.layer.shadowPath = roundedRectanglePath1.CGPath;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOpacity = 0.5;
}


@end
