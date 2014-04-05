//
//  AlertIndicatorControl.h
//  SweetAlarm
//
//  Created by 振杰 李 on 11-12-27.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FanxerIndicatorControl : UIView{
    
    UIActivityIndicatorView *ind;
    
    UILabel *label;
    
    NSString *title;
    
    NSString *message;
    
    UILabel *messagelabel;
    
    UIImageView *imgview;
    
}

@property (nonatomic,retain) UIActivityIndicatorView *ind;

@property (nonatomic,retain) UILabel *label;

@property (nonatomic,retain) NSString *title;

@property (nonatomic,retain) NSString *message;

@property (nonatomic,retain) UILabel *messagelabel;

- (id)initWithFrame:(CGRect)frame message:(NSString *)messages title:(NSString *)titles bgimg:(UIImage *)img;


@end
