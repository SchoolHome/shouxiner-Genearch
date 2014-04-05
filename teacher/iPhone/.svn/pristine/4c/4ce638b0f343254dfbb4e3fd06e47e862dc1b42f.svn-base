//
//  FXSexChanger.m
//  Shuangshuang
//
//  Created by 振杰 李 on 12-3-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXSexChanger.h"

@implementation FXSexChanger
@synthesize female;
@synthesize male;
@synthesize sexvalue;
@synthesize delegate;

//-(void)dealloc{
//    
//    
//    [male release];
//    [female release];
//    [super dealloc];
//    
//}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        sexvalue=0;    
        male=[[UIImageView alloc] initWithFrame:self.bounds];
        
        male.image=SEX_MALE_IMG;
        
        [self addSubview:male];
    
        [male setHidden:YES];     
        
        female= [[UIImageView alloc] initWithFrame:self.bounds];
        
        female.image=SEX_FEMALE_IMG;
       
        [self addSubview:female];
    }
    
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:0.75];
    
    [UIView setAnimationDelegate:self];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self cache:YES];
    
    if (sexvalue==0) {
        [self insertSubview:male aboveSubview:female];
        [male setHidden:NO];
        [female setHidden:YES];
        sexvalue=1;
        
    
    }else{
        
        [self insertSubview:female aboveSubview:male];
        [male setHidden:YES];
        [female setHidden:NO];
        sexvalue=0;
    }
    [UIView commitAnimations];
    
    [self performSelector:@selector(ChangeSexInfo) withObject:nil afterDelay:0.75];
}

-(void)ChangeSexInfo{
    
    if (delegate!=nil) {
        [delegate changeSexInfo:sexvalue];
    }
}


@end
