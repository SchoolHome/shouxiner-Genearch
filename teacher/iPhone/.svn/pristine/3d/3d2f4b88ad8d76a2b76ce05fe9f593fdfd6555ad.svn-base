//
//  NavigationRightSingleStyle.m
//  SweetAlarm
//
//  Created by 振杰 李 on 11-12-19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "NavigationRightSingleStyle.h"

@implementation NavigationRightSingleStyle
@synthesize rightimg;


-(id)initWithTitle:(NSString *)titles{
    
    self=[super initWithTitle:titles];
    
    if(self!=nil){
        
        rightimg=ROOT_NAVIGATION_RB_IMG;
        
    }
    
    return self;
}

-(id)initWithTitle:(NSString *)titles withRightImg:(UIImage *)image{
    self=[super initWithTitle:titles];
    if(self!=nil){
        rightimg=image;
    }
    return self;
}

#pragma mark -
#pragma mark StyleProtocol method 

-(UIImage *) rightPicture{
    
    return rightimg;
}



@end
