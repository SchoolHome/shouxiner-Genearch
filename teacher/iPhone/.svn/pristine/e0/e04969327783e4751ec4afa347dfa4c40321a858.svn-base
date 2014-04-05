//
//  FxDownBall.m
//  Shuangshuang
//
//  Created by 振杰 李 on 12-3-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FxImgBall.h"

@implementation FxImgBall

@synthesize agview;
@synthesize delegate;
@synthesize isChangeImage = _isChangeImage , button = _button;

-(id)initWithFrame:(CGRect)frame 
               img:(UIImage *)img opttype:(int)operatetype{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled=YES;
      
        [self setBackgroundColor:[UIColor clearColor]];
        
        button=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setImage:img forState:UIControlStateNormal];
        
        button.frame=self.bounds;
        
        [button addTarget:self action:@selector(doTest) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        self.isChangeImage = YES;
//        agview=[[AGMedallionView alloc] initWithFrame:self.bounds];
//        agview.userInteractionEnabled=YES;
//        agview.image=img;
//        
//        [agview addTarget:self action:@selector(doTest) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self addSubview:agview];
   
        
    }
    return self;
    
}


-(id)initWithFrame:(CGRect)frame img:(UIImage *)img needhightlight:(BOOL)needhight{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled=YES;
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        button=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setImage:img forState:UIControlStateNormal];
        
        if (needhight==NO) {
                  [button setImage:img forState:UIControlStateHighlighted];
        }
        button.frame=self.bounds;
        
        [button addTarget:self action:@selector(doTest) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
    }
    return self;
    
}


-(void)StartSelfRotate{
    
    if (runtimer==nil) {
        
        runtimer=[NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(Rotate) userInfo:nil repeats:YES];
   
    }
    
}

-(void)Rotate{
    
    agview.transform=CGAffineTransformMakeRotation(myangle);
    myangle+=0.1;
}

-(void)StopSelfRotate{
    if (runtimer!=nil) {
        
        [runtimer invalidate];
        
        runtimer=nil;
    }
}


-(void)doTest{
    
    if (!self.isChangeImage) {
        return;
    }
    
    actionsheet=[[UIActionSheet alloc] initWithTitle:@"选择照片"
                                            delegate:self 
                                   cancelButtonTitle:@"取  消" 
                              destructiveButtonTitle:nil 
                                   otherButtonTitles:@"拍  照",@"从相册选择", nil];
    
    [actionsheet showInView:self.superview];

}





-(void)ResetImage:(UIImage *)img{

    [button removeFromSuperview];
    
    agview=[[AGMedallionView alloc] initWithFrame:self.bounds];
    
    agview.userInteractionEnabled=YES;
    
    agview.image=img;
    
    [agview addTarget:self action:@selector(doTest) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:agview];
}

-(void)ReloadImg:(UIImage *)img{
    
    [agview removeFromSuperview];
    [button removeFromSuperview];
    button=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setImage:img forState:UIControlStateNormal];
    
    button.frame=self.bounds;
    
    [button addTarget:self action:@selector(doTest) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    
}

-(UIImage *)retriveImg{
    
    return self.agview.image;
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

#pragma mark -
#pragma mark UIActionSheetDelegate method
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==0) {
        
        if(delegate!=nil){
            
            [delegate ChooseImageFrom:0 tag:self.tag];
            
        }
    }
    if (buttonIndex==1) {
        
        if (delegate!=nil) {
            
            [delegate ChooseImageFrom:1 tag:self.tag];
            
        }
    }
}


@end
