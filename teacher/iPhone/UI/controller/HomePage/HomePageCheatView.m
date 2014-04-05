//
//  HomePageCheatView.m
//  iCouple
//
//  Created by ming bright on 12-9-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomePageCheatView.h"

@implementation HomePageCheatView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];
        
        UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake((320-492/2)/2, (480-350/2)/2, 492/2, 350/2)];
        background.image = [UIImage imageNamed:@"float_goteam"];
        [self addSubview:background];
        
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        closeButton.backgroundColor = [UIColor clearColor];
        closeButton.frame = CGRectMake(240, 170, 49, 49);
        [closeButton setImage:[UIImage imageNamed:@"btn_on_close"] forState:UIControlStateNormal];
        [closeButton setImage:[UIImage imageNamed:@"btn_on_close_hover"] forState:UIControlStateHighlighted];
        [self addSubview:closeButton];
        [closeButton addTarget:self action:@selector(closeButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton *tiaoxi = [UIButton buttonWithType:UIButtonTypeCustom];
        tiaoxi.frame  = CGRectMake(140, 270, 214/2, 72/2);
        [tiaoxi setBackgroundImage:[UIImage imageNamed:@"profile_btn_red_nor"] forState:UIControlStateNormal];
        [tiaoxi setBackgroundImage:[UIImage imageNamed:@"profile_btn_red_press"] forState:UIControlStateHighlighted];
        [tiaoxi addTarget:self action:@selector(tiaxiTaped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tiaoxi];
        [tiaoxi setTitle:@"调戏一下" forState:UIControlStateNormal];
        tiaoxi.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        
    }
    return self;
}

-(void)closeButtonTaped:(id)sender{
    [UIView animateWithDuration:0.1 animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)tiaxiTaped:(id)sender{
    
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(homePageCheatViewTaped:)]) {
               [self.delegate homePageCheatViewTaped:self];
            }
    
    [self removeFromSuperview];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.1 animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
