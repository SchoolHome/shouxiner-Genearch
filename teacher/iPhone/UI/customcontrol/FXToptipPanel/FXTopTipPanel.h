//
//  FXTopTipPanel.h
//  MedianAlarm
//
//  Created by 振杰 李 on 12-2-23.
//  Copyright (c) 2012年 pansi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FanxerHeader.h"
@protocol FXTopTipPanelDelegate;
@interface FXTopTipPanel : UIView
@property (nonatomic,strong) UIImageView *backgroundimgview;
@property (nonatomic,strong) UILabel *messagelabel; 
@property (nonatomic,strong) NSString *message;
@property (nonatomic,assign) id <FXTopTipPanelDelegate> delegate;
- (id)initWithFrame:(CGRect)frame message:(NSString *)message;
-(void)ResetMessage:(NSString *)message;
@end
