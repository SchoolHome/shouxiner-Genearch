//
//  FXShakePanel.m
//  ShakeIcon
//
//  Created by 振杰 李 on 12-3-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXShakePanel.h"

@implementation FXShakePanel
@synthesize picicon;
@synthesize title;
@synthesize optdelegate;

- (id)initWithFrame:(CGRect)frame displayinfo:(NSObject<FXShakePanelDisplayDelegate> *)display
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        closebutton=[UIButton buttonWithType:UIButtonTypeCustom];
        closebutton.frame=CGRectMake(self.frame.size.width-(55/2)/2-12, -2, 55/2, 55/2);
        
        [closebutton addTarget:self action:@selector(DoCloseCurrentBox) forControlEvents:UIControlEventTouchUpInside];
        
        [closebutton setImage:[UIImage imageNamed:@"btn_grid_close.png"] forState:UIControlStateNormal];
        
        [closebutton setImage:[UIImage imageNamed:@"btn_grid_close_press.png"] forState:UIControlStateHighlighted];
        
        closebutton.alpha=0.0;
        
        picicon=[[FXPictureIcon alloc] initWithFrame:CGRectMake(10,5, 60, 60) image:[display getPicIcon]];
        
        [self addSubview:picicon];
        
        [self addSubview:closebutton];

        
        title=[[UILabel alloc] initWithFrame:CGRectMake(0.0, 68, self.frame.size.width, 15)];
        
        title.text=[display getDisplayTitle];
        
        title.textAlignment=UITextAlignmentCenter;
        
        title.font=[UIFont systemFontOfSize:12.0];
        
        [self addSubview:title];
        
        
    }
    return self;
}


-(void)NotifyShowCloseButton{
 
    closebutton.alpha=1.0;
    
}


-(void)DoCloseCurrentBox{
    if (optdelegate!=nil) {
        [optdelegate DeleteNotify:self];
    }
}
@end
