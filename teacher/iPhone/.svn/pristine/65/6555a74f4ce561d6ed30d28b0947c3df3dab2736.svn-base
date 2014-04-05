//
//  ARLevelView.m
//  iCouple
//
//  Created by ming bright on 12-6-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ARLevelView.h"

@implementation ARLevelView
@synthesize level;

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}

-(void)setLevel:(NSInteger)level_{
    level = level_;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    float beginpoint=5.0;
    float endingpoint=35.0;
    float golballength=12.0;
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
	CGContextSetLineWidth(context, 3.0);
    if (level==0) {
        CGContextMoveToPoint(context, beginpoint, endingpoint);
        CGContextAddLineToPoint(context, golballength, endingpoint);
        CGContextStrokePath(context);
    }else {
        for (int i=0; i<=(level/2); i++) {
            CGContextMoveToPoint(context, beginpoint, endingpoint);
            CGContextAddLineToPoint(context, golballength, endingpoint);
            CGContextStrokePath(context);
            beginpoint-=1;
            endingpoint=endingpoint-5.0;
            golballength+=1;
        }
    }
}

@end
