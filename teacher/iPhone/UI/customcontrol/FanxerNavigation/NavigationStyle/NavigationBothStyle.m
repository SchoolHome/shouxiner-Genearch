//
//  NavigationBothStyle.m
//  SweetAlarm
//
//  Created by 振杰 李 on 11-12-19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "NavigationBothStyle.h"

@implementation NavigationBothStyle
@synthesize rightimg;
@synthesize leftimg;
@synthesize rightview;
@synthesize leftview;


-(id)initWithTitle:(NSString *)titles
{
    
    self=[super initWithTitle:titles];
    if (self!=nil) {
        leftimg=ROOT_NAVIGATION_LB_IMG;
        
        rightimg=ROOT_NAVIGATION_RB_IMG;      
    }
    return self;
}

-(id)initWithTitle:(NSString *)titles
           Leftimg:(UIImage *)leftimgs 
          Rightimg:(UIImage *)rigthimgs
{
    
    self=[super initWithTitle:titles];
    if (self!=nil) {
        leftimg=leftimgs;
        rightimg=rigthimgs;      
    }

    return self;
}


-(id)initWithTitle:(NSString *)titles 
       Leftcontrol:(UIView *)leftviews
      Rightcontrol:(UIView *)rigtviews
{
    self=[super initWithTitle:titles];
    if (self!=nil) {
        leftview=leftviews;
        rightview=rigtviews;
    }
    return self;
}



#pragma mark -
#pragma mark StyleProtocol method

-(UIImage *)leftPicture{
    return  leftimg;
}

-(UIImage *)rightPicture{
    return rightimg;
}


-(UIView *)leftControl{
    return leftview;
}

-(UIView *)rightControl{
    return rightview;
}



@end
