//
//  FanxerNavigationBar.m
//  SweetAlarm
//
//  Created by 振杰 李 on 11-12-7.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "FanxerNavigationBarControl.h"

#define BACK_AGE_X 0.0
#define BACK_AGE_Y 0.0
#define BACK_AGE_WIDTH 320
#define BACK_AGE_HIGH 49


#define LEFT_BTN_X 15+20
#define LEFT_BTN_Y 3
#define LEFT_BTN_WIDTH 35.0
#define LEFT_BTN_HIGH 35.0


#define RIGHT_BTN_X 252.0-20
#define RIGHT_BTN_Y 7.0
#define RIGHT_BTN_WIDTH 53.0 
#define RIGHT_BTN_HIGH 28.5


#define CENTER_LABEL_X 60
#define CENTER_LABEL_Y 5.0
#define CENTER_LABEL_WIDTH 200.0
#define CENTER_LABEL_HIGH 33.0 


@implementation FanxerNavigationBarControl

@synthesize backageview;
@synthesize backImage = _backImage;
@synthesize rightbutton;
@synthesize leftbutton;
@synthesize _delegate = __delegate;
@synthesize centertitle;
@synthesize styleobj;


- (id)initWithFrame:(CGRect)frame withStyle:(NSObject<StyleProtocol> *)style withDefinedUserControl:(BOOL)yesornot;
{
    self = [super initWithFrame:frame];
    if (self) {
        
        styleobj=style;
        self.backgroundColor=[UIColor clearColor];
        backageview=[[UIImageView alloc] initWithFrame:CGRectMake(BACK_AGE_X, BACK_AGE_Y, BACK_AGE_WIDTH, BACK_AGE_HIGH)];
        if (styleobj.BackGround!=nil) {
            backageview.image=styleobj.BackGround; 
            self.backImage = styleobj.BackGround;
        }
        [self addSubview:backageview];
        
        centertitle=[[UILabel alloc] initWithFrame:CGRectMake(CENTER_LABEL_X, CENTER_LABEL_Y, CENTER_LABEL_WIDTH,CENTER_LABEL_HIGH)];
        
        centertitle.backgroundColor=[UIColor clearColor];
        centertitle.text=[style centertitle];
        
        centertitle.textAlignment=UITextAlignmentCenter;
        [centertitle setTextColor:[UIColor whiteColor]];
        [centertitle setShadowColor:[UIColor blackColor]];
        [centertitle setShadowOffset:CGSizeMake(0, -1)];
        [centertitle setFont:[UIFont systemFontOfSize:20.0f]];
        [self addSubview:centertitle];
        
        if(yesornot==NO){
        if(styleobj.leftPicture!=nil){
        
        leftbutton=[UIButton buttonWithType:UIButtonTypeCustom];
        leftbutton.frame=CGRectMake(LEFT_BTN_X, LEFT_BTN_Y, LEFT_BTN_WIDTH, LEFT_BTN_HIGH);
        
        [leftbutton setImage:styleobj.leftPicture forState:UIControlStateNormal];
        
        [leftbutton addTarget:self action:@selector(doLeft) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:leftbutton];
            
        }
        
        if(styleobj.rightPicture!=nil){
            
        rightbutton=[UIButton buttonWithType:UIButtonTypeCustom];
            
        [rightbutton addTarget:self action:@selector(doRight) forControlEvents:UIControlEventTouchUpInside];
        
        [rightbutton setImage:styleobj.rightPicture forState:UIControlStateNormal];
        
        rightbutton.frame=CGRectMake(RIGHT_BTN_X, RIGHT_BTN_Y, RIGHT_BTN_WIDTH, RIGHT_BTN_HIGH);
        
        [self addSubview:rightbutton];
            
        }
        
        }else{
            if(styleobj.rightControl!=nil){
            rightbutton = (UIButton *)styleobj.rightControl;
            [rightbutton addTarget:self action:@selector(doRight) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:rightbutton];
            }
            
            if(styleobj.leftControl!=nil){
                leftbutton = (UIButton *)styleobj.leftControl;
                [leftbutton addTarget:self action:@selector(doLeft) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:leftbutton];
            }
        }
        
        
        
        
    }
    return self;
}

-(void)ResetTitle:(NSString *)title{
    
    centertitle.text=title;
}

-(void)doRight{
    
    if(self._delegate!=nil){
        
        [self._delegate doRight];
    }
    
}

-(void)ResetRightControl:(UIView *)buttonview{
    
    rightbutton.enabled=NO;
    rightbutton.hidden=YES;
    
    [(UIButton *)buttonview addTarget:self action:@selector(doExtraRight) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:buttonview];
    
}

-(void)ResetLeftControl:(UIView *)buttonview{
    
    rightbutton.enabled=NO;
    rightbutton.hidden=YES;
    [(UIButton *)buttonview addTarget:self action:@selector(doExtraLeft) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:buttonview];
}

-(void)doLeft{
    
    if(self._delegate!=nil){
        
        [self._delegate doLeft];
        
    }
    
}

-(void)doExtraLeft{
    
    if (self._delegate!=nil) {
        
        [self._delegate doExtraLeft];
    
    }
}

-(void)doExtraRight{
    
    if (self._delegate!=nil) {
        
        [self._delegate doExtraRight];
   
    }
}

-(void)RecoverLeftViewWithTag:(NSInteger)tag{
    
    UIView *view=[self viewWithTag:tag];
    
    [view removeFromSuperview];
    
    leftbutton.enabled=YES;
    leftbutton.hidden=NO;
    
}

-(void)RecoverRightViewWithTag:(NSInteger)tag{
    
    UIView *view=[self viewWithTag:tag];
    
    [view removeFromSuperview];
    
    rightbutton.enabled=YES;
    rightbutton.hidden=NO;
    
}
@end
