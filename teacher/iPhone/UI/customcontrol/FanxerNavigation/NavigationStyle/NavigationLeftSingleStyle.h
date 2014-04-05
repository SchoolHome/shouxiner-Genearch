//
//  NavigationLeftSingleStyle.h
//  SweetAlarm
//
//  Created by 振杰 李 on 11-12-19.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "NavigationDefaultStyle.h"
#import "FanxerHeader.h"
@interface NavigationLeftSingleStyle : NavigationDefaultStyle<StyleProtocol>{
    
    UIImage *leftimg;
    UIView *leftview;
    
}
@property (strong,nonatomic) UIImage *leftimg;
@property (strong,nonatomic) UIView *leftview;

-(id)initWithTitle:(NSString *)titles;

-(id)initWithTitle:(NSString *)titles withLeftImg:(UIImage *)image;

-(id)initWithTitle:(NSString *)titles withLeftControl:(UIView *)leftview;

@end
