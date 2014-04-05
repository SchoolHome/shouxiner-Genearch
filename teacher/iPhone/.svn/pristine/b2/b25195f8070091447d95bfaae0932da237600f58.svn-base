//
//  NavigationStyle.m
//  SweetAlarm
//
//  Created by 振杰 李 on 11-12-19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "NavigationDefaultStyle.h"

@implementation NavigationDefaultStyle
@synthesize background;
@synthesize title;
-(id)initWithTitle:(NSString *)titles{
    
    self=[super init];
    
    if(self!=nil){
        
        background=ROOT_NAVIGATION_BG_IMG;
        
        title=titles;
        
    }
    return self;
}



#pragma mark -
#pragma mark StyleProtocol method

-(UIImage *)BackGround{
    
    return background;
}

-(NSString *)centertitle{
    if(title==nil){
        return @"";
    }
    
    return title;
}

-(UIImage *) leftPicture{
    return nil;
}

-(UIImage *) rightPicture{
    return nil;
}

-(UIView *)leftControl{
    return nil;
}

-(UIView *)rightControl{
    return nil;
}

@end
