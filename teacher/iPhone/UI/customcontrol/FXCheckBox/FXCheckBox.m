//
//  FXCheckBox.m
//  Shuangshuang
//
//  Created by 振杰 李 on 12-3-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXCheckBox.h"

@implementation FXCheckBox
@synthesize ischeck;



-(id)initWithFrame:(CGRect)frame isCheck:(BOOL)ischecks{
    
     self=[super initWithFrame:frame];
    if (self) {

       
        if (ischecks) {
            ischeck=YES;    
            [self setBackgroundImage:FX_CHECK_BOX_ON forState:UIControlStateNormal];
            
        }else{
            ischeck=NO;
            [self setBackgroundImage:FX_CHECK_BOX_OFF forState:UIControlStateNormal];
        }
    }
   
    return self;
}


-(BOOL)CheckFor:(BOOL)ischecks{
    
    if (ischecks) {
        [self setBackgroundImage:FX_CHECK_BOX_ON forState:UIControlStateNormal];
        ischeck=YES;
        return YES;
    }else{
        [self setBackgroundImage:FX_CHECK_BOX_OFF forState:UIControlStateNormal];
        ischeck=NO;
        return NO;
        
    }
    
}

@end
