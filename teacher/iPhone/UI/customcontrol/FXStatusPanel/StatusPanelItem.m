//
//  StatusPanelItem.m
//  iCouple
//
//  Created by 振杰 李 on 12-3-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "StatusPanelItem.h"

@implementation StatusPanelItem
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame title:(NSString *)title img:(UIImage *)img
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled=YES;
        button =[UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:FXRect(0.0, 0.0,70, 70)];
        
        
        //[[UIImageView alloc] initWithFrame:];
        //imgview.userInteractionEnabled=YES;
       // imgview.image=img;
        [button setImage:img forState:UIControlStateNormal];
        [button addTarget:self action:@selector(DoClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        label = [[UILabel alloc] initWithFrame:FXRect(0.0, 71, 70, 12)];
        
        
        label.backgroundColor=[UIColor clearColor];
        
        label.textColor =[UIColor whiteColor];
        label.font=[UIFont boldSystemFontOfSize:12.0];
        
        label.textAlignment=UITextAlignmentCenter;
        
        label.text=title;
        
        [self addSubview:label];
        
        
        
    }
    return self;
}


-(void)DoClick{
    
    [button setHighlighted:YES];
    if (delegate!=nil) {
        
        [delegate doChooseStatus:self.tag];
        
    }
}
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//    if (delegate!=nil) {
//        
//        [delegate doChooseStatus:self.tag];
//        
//    }
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
