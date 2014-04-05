//
//  NavigationBothStyle.h
//  SweetAlarm
//
//  Created by 振杰 李 on 11-12-19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "NavigationDefaultStyle.h"
#import "FanxerHeader.h"
@interface NavigationBothStyle : NavigationDefaultStyle <StyleProtocol> {
    
    UIImage *leftimg;
    
    UIImage *rightimg;
    
    UIView *leftview;
    
    UIView *rightview;

}
@property (strong,nonatomic) UIImage *leftimg;
@property (strong,nonatomic) UIImage *rightimg;
@property (strong,nonatomic) UIView *leftview;
@property (strong,nonatomic) UIView *rightview;

-(id)initWithTitle:(NSString *)titles;

-(id)initWithTitle:(NSString *)titles Leftimg:(UIImage *)leftimg Rightimg:(UIImage *)rigthimg;

-(id)initWithTitle:(NSString *)titles 
       Leftcontrol:(UIButton *)leftview
      Rightcontrol:(UIButton *)rigtview;

@end
