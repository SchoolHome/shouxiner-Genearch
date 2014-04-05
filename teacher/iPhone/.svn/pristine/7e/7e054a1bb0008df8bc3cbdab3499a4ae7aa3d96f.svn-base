//
//  NavigationLeftSingleStyle.m
//  SweetAlarm
//
//  Created by 振杰 李 on 11-12-19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "NavigationLeftSingleStyle.h"

@implementation NavigationLeftSingleStyle
@synthesize leftimg;
@synthesize leftview;
//-(void)dealloc{
//    
//    [leftimg release];
//    [leftview release];
//    [super dealloc];
//}

-(id)initWithTitle:(NSString *)titles{
    
    self=[super initWithTitle:titles];
    if (self!=nil) {
        leftimg=ROOT_NAVIGATION_LB_IMG;
    }
    return self;
}

-(id)initWithTitle:(NSString *)titles withLeftImg:(UIImage *)image{
    
    self=[super initWithTitle:titles];
    if (self!=nil) {
        leftimg=image;
    }

    return self;
}

-(id)initWithTitle:(NSString *)titles withLeftControl:(UIView *)leftviews{
    
    self = [super initWithTitle:titles];
    if (self!=nil) {
        
        leftview=leftviews;
    }
    return self;
}

#pragma mark -
#pragma mark StyleProtocol method

-(UIImage *)leftPicture{
    return leftimg;
}

-(UIView *)leftControl{
    return leftview;
}
@end
