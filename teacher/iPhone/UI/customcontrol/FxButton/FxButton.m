//
//  FxMoreNextButton.m
//  SweetAlarm
//
//  Created by 振杰 李 on 12-2-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FxButton.h"
#define TEXT_LABEL_X 12.0
#define TEXT_LABEL_Y 16.0
#define TEXT_LABEL_WIDTH 150.0
#define TEXT_LABEL_HIGH 16.5

#define ARROW_X 277.5
#define ARROW_Y 16
#define ARROW_WIDTH 9.5
#define ARROW_HIGH 14

#define DEFAULT_TEXT_HIGH 16


#define MULITY_TEXT_WIDTH 125.0
#define MULITY_TEXT_X 40.0
#define MULITY_TEXT_Y 10.0
#define MULITY_TEXT_COUNT 7


#define FX_SHAKE_DURATION 0.05
#define FX_SHAKE_REPEATE 3
#define FX_SHAKE_LENGTH 20.0f

#define FX_SHAKE_ALERT_WIDTH 30
#define FX_SHAKE_ALERT_HEIGHT 30
@implementation FxButton

@synthesize arrowimg;
@synthesize textlabel;
@synthesize optag;
@synthesize controlarray;
//
//-(void)dealloc{
//    
//    [arrowimg release];
//    [textlabel release];
//    [super dealloc];
//    
//}




- (id)initWithFrame:(CGRect)frame backGroundImg:(UIImage *)bg operationTag:(NSInteger)optag 
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:bg forState:UIControlStateNormal];
        
 
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame title:(NSString *)title operationTag:(NSInteger)operationtag{
    
    self=[super initWithFrame:frame];
    if(self){
        optag=operationtag;
        textlabel=[[UILabel alloc] initWithFrame:FXRect(TEXT_LABEL_X,TEXT_LABEL_Y,TEXT_LABEL_WIDTH,TEXT_LABEL_HIGH)];
        textlabel.text=title;
        textlabel.backgroundColor=[UIColor clearColor];
        [self addSubview:textlabel];
        arrowimg=[[UIImageView alloc] initWithFrame:FXRect(ARROW_X, ARROW_Y, ARROW_WIDTH, ARROW_HIGH)];
             
        [self addSubview:arrowimg];
        
     
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame title:(NSString *)title img:(UIImage *)img operationTag:(NSInteger)operationtag{
    
   self=[super initWithFrame:frame];
    if(self){
        optag=operationtag;
        [self setImage:img forState:UIControlStateNormal];
       
        textlabel=[[UILabel alloc] initWithFrame:FXRect(TEXT_LABEL_X-9,TEXT_LABEL_Y-5,frame.size.width-6,DEFAULT_TEXT_HIGH)];
        textlabel.text=title;
        textlabel.textAlignment=UITextAlignmentCenter;
        textlabel.font=[UIFont boldSystemFontOfSize:15];
        textlabel.textColor=[UIColor whiteColor];
        
        textlabel.backgroundColor=[UIColor clearColor];
        
        [self addSubview:textlabel];
        
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame
              title:(NSString *)title 
          withcolor:(UIColor *)color
                img:(UIImage *)img 
            ismulti:(BOOL)ismulti 
       operationTag:(NSInteger)operationtag{
    self=[super initWithFrame:frame];
    if (self) {
        optag=operationtag;
        [self setImage:img forState:UIControlStateNormal];
        if(ismulti==YES){
        textlabel=[[UILabel alloc] initWithFrame:FXRect(MULITY_TEXT_X, MULITY_TEXT_Y, MULITY_TEXT_WIDTH, 0.0)];
        textlabel.text=title;
        textlabel.font=[UIFont boldSystemFontOfSize:17];
        int lines=0;
         CGSize newsize=[self calcLabelSize:title withFont:textlabel.font maxSize:textlabel.frame.size];
        if([title length]%MULITY_TEXT_COUNT==0){
            lines=[title length]/MULITY_TEXT_COUNT;
        }else{
            lines=[title length]/MULITY_TEXT_COUNT+1;
        }
        
        textlabel.lineBreakMode=UILineBreakModeWordWrap;
        textlabel.numberOfLines=lines;
        textlabel.backgroundColor=[UIColor clearColor];
        
        float dynamic_high = newsize.height * lines;
        
        CGRect rect=textlabel.frame;
        
        rect.size.height=dynamic_high; 
        
        textlabel.frame=rect;
            
        }else{
            
            textlabel=[[UILabel alloc] initWithFrame:FXRect(TEXT_LABEL_X-9,TEXT_LABEL_Y-5,frame.size.width-6,DEFAULT_TEXT_HIGH)];
            textlabel.text=title;
            textlabel.textAlignment=UITextAlignmentCenter;
            textlabel.font=[UIFont boldSystemFontOfSize:15];
            textlabel.backgroundColor=[UIColor clearColor]; 
            
        }
        
        if (color==nil) {
            textlabel.textColor=[UIColor whiteColor];
        }else{
            textlabel.textColor=color;
        }
        [self addSubview:textlabel];
    
    }
    return self;
}


-(id)initWithFrame:(CGRect)frame backGroundImgNormal:(UIImage *)bg backGroundImgHight:(UIImage *)bgh ControlArray:(NSMutableArray *)controlarrays operationTag:(NSInteger)optag{
    self=[super initWithFrame:frame];
    
    if(self){
        
        controlarray=controlarrays;
        if (controlarray!=nil) {
            
            for (int i=0; i<[controlarray count]; i++) {
                UIView *view=[controlarray objectAtIndex:i];
                [self addSubview:view];
            }
            
        }
        if (bg!=nil) {
            
            [self setBackgroundImage:bg forState:UIControlStateNormal];
        }
        
        if (bgh!=nil) {
            
            [self setBackgroundImage:bgh forState:UIControlStateHighlighted];
        }
    }
    
    return self;
}


-(CGSize) calcLabelSize:(NSString *)string withFont:(UIFont *)font  maxSize:(CGSize)maxSize{
    
    
    return [string
            sizeWithFont:font
            constrainedToSize:maxSize
            lineBreakMode:UILineBreakModeWordWrap];
}


-(void)setCountryCodeContent:(NSString *)countrycode{
    
    
}


-(void)setContentView:(UIView *)contentview{
    
    if (contentview==nil) {
        return;
    }
    for (int i=0; i<[[self subviews] count]; i++) {
        if (![[[self subviews] objectAtIndex:i] isKindOfClass:[UIImageView class]]) {
            UIView *viewfordelete=[[self subviews] objectAtIndex:i];
            
            [viewfordelete removeFromSuperview];
        }
        
    }
    
    
    
    [self addSubview:contentview];
}


-(void)LoadColor:(NSString *)hexcolor withTag:(NSInteger)tag{
    
    UIView *view=[self viewWithTag:tag];
    
    if ([view isKindOfClass:[UILabel class]]) {
        UILabel *t=(UILabel *)view;
        
        t.textColor=[UIColor colorWithHexString:hexcolor];
        
    }
    
}


-(void)ResetText:(NSString *)text withTage:(NSInteger)tag{
    UILabel *label=(UILabel *)[self viewWithTag:tag];
    label.text=text;
}


- (void)do_shake{
    CABasicAnimation *animation = 
    [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:FX_SHAKE_DURATION];
    [animation setRepeatCount:FX_SHAKE_REPEATE];
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint:
                             CGPointMake([self center].x - FX_SHAKE_LENGTH, [self center].y)]];
    [animation setToValue:[NSValue valueWithCGPoint:
                           CGPointMake([self center].x + FX_SHAKE_LENGTH, [self center].y)]];
    [[self layer] addAnimation:animation forKey:@"position"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/



@end
