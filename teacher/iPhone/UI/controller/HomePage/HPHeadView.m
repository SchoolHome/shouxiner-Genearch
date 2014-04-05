//
//  HPHeadView.m
//  Head_dev
//
//  Created by ming bright on 12-6-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HPHeadView.h"


@implementation HPHeadView
@synthesize backImage;
@synthesize cycleImage;
@synthesize maskImage;
@synthesize borderWidth;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame]; 
    if (self) {
        
        self.borderWidth = 0;
        
        backLayer = [CALayer new];
        cycleLayer = [CALayer new];
        maskLayer = [CALayer new];
        
        [self.layer addSublayer:backLayer];
        [self.layer addSublayer:cycleLayer];
        [self.layer addSublayer:maskLayer];
        
        maskLayer.hidden = YES;
        
        backLayer.frame = CGRectMake(borderWidth, borderWidth, self.frame.size.width - 2*borderWidth, self.frame.size.height - 2*borderWidth);
        cycleLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        maskLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
        backLayer.masksToBounds = YES;
        backLayer.cornerRadius = backLayer.frame.size.width/2;
        
        self.maskImage = [UIImage imageNamed:@"headpic_index_press_120x120"];
    }
    
    return self;
}

-(void)setFrame:(CGRect)frame_{
    [super setFrame:frame_];
    
    backLayer.frame = CGRectMake(borderWidth, borderWidth, self.frame.size.width - 2*borderWidth, self.frame.size.height - 2*borderWidth);
    cycleLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    maskLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    backLayer.masksToBounds = YES;
    backLayer.cornerRadius = backLayer.frame.size.width/2;
    
}

- (void)setBackImage:(UIImage *)backImage_{
    backImage = backImage_;
    backLayer.contents = (id)backImage.CGImage;
}

- (void)setCycleImage:(UIImage *)cycleImage_{
    cycleImage = cycleImage_;
    cycleLayer.contents = (id)cycleImage.CGImage;
}

- (void)setMaskImage:(UIImage *)maskImage_{
    maskImage = maskImage_;
    maskLayer.contents = (id)maskImage.CGImage;
}

-(void)setBorderWidth:(CGFloat)borderWidth_{
    borderWidth = borderWidth_;
    backLayer.frame = CGRectMake(borderWidth, borderWidth, self.frame.size.width - 2*borderWidth, self.frame.size.height - 2*borderWidth);
    backLayer.masksToBounds = YES;
    backLayer.cornerRadius = (backLayer.frame.size.width- 2*borderWidth)/2;
}


- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    maskLayer.hidden = NO;
    return YES;
    
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    maskLayer.hidden = YES;
}
- (void)cancelTrackingWithEvent:(UIEvent *)event{
    maskLayer.hidden = YES;
}

@end
