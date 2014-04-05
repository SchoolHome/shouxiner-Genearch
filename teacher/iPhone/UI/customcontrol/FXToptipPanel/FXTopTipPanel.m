//
//  FXTopTipPanel.m
//  MedianAlarm
//
//  Created by 振杰 李 on 12-2-23.
//  Copyright (c) 2012年 pansi. All rights reserved.
//

#import "FXTopTipPanel.h"


//596 × 176


#define MESSAGE_X 0.0
#define MESSAGE_Y 38/2
#define MESSAGE_WIDTH 500/2
#define MESSAGE_HIGH  90/2


#define CLOSE_WIDTH 24
#define CLOSE_HIGH 24

@implementation FXTopTipPanel
@synthesize backgroundimgview = _backgroundimgview;
@synthesize messagelabel = _messagelabel;
@synthesize message = _message;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame message:(NSString *)mes
{
    self = [super initWithFrame:frame];
    if (self) {
        self.message=mes;
        
        self.backgroundimgview=[[UIImageView alloc] initWithFrame:self.bounds];
        self.backgroundimgview.image=TOP_TIP_PANEL_BG;
        [self addSubview:self.backgroundimgview];
        
        self.messagelabel =[[UILabel alloc] initWithFrame:FXRect(MESSAGE_X, MESSAGE_Y-20, MESSAGE_WIDTH, MESSAGE_HIGH)];
        self.messagelabel.text= self.message;
        self.messagelabel.textAlignment=UITextAlignmentCenter;
        self.messagelabel.textColor= [UIColor whiteColor];
        self.messagelabel.backgroundColor=[UIColor clearColor];
        self.messagelabel.font=[UIFont boldSystemFontOfSize:14];
        self.messagelabel.numberOfLines=1;
        
        [self addSubview:self.messagelabel];
        
    }
    return self;
}

-(void)ResetMessage:(NSString *)message{
    
    self.messagelabel.text=message;
    
}

-(void)dealloc{
    [super dealloc];
}



@end
