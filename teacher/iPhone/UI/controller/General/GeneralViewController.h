//
//  GeneralViewController.h
//  iCoupleUI
//
//  Created by Eric yang on 3/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@protocol LoadingDelegate <NSObject>

@optional
-(void) onTimeOut;

@end

#import <UIKit/UIKit.h>

/*
 通用视图控制器
 */
@class FanxerIndicatorControl;
@class FXTopTipPanel;
@class CBlockView;
@interface GeneralViewController : UIViewController{
    UIView * blockview;
    FanxerIndicatorControl * fxind;
    FXTopTipPanel * toptippanel;
 
}
@property (nonatomic, strong) NSString * loading_content_string;
@property (nonatomic, strong) NSString * toptip_string;
@property (assign,nonatomic) id delegate;
@property (nonatomic, assign) float loading_interval;

@property (nonatomic) BOOL hasOnTimeOut;

- (void)do_init_main_view;


- (void)do_init_loading_view;
- (void)do_destory_loading_view;

- (void)do_show_loading_view_content_string:(NSString *)content_string;
- (void)do_hide_loading_view;
- (void)loadingOnTimeOut;

- (void)do_init_toptip_view;
- (void)do_destory_toptip_view;

- (void)do_show_toptip_view_toptip_string:(NSString *)toptip_string;
- (void)do_hide_toptip_view;





@end
