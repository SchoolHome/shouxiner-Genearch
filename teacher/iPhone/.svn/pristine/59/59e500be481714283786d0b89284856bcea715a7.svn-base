//
//  ForgetViewController.h
//  iCouple
//
//  Created by lixiaosong on 12-3-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GeneralViewController.h"
#import "FXCountDown.h"
#import "FXShakeField.h"
#import "FXTopTipPanelDelegate.h"
@class FXMobilePanel;
@interface ForgetViewController : GeneralViewController<FXCountDownDelegate,FXShakeFieldDelegate,FXTopTipPanelDelegate>
@property (nonatomic, retain) FXMobilePanel * mobiel_panel;
@property (nonatomic, retain) FXShakeField * password_field;
@property (nonatomic, retain) FXShakeField * verify_code_field;
@property (nonatomic, retain) FXCountDown * count_down;
@property (nonatomic, retain) UIButton * submit_button;
@property (nonatomic, retain) UIButton * resend_button;
@property (nonatomic, strong) UIButton * cancel_button;
@property (nonatomic, strong) NSString * end_username_string;
@property (nonatomic, strong) NSString * end_mobile_string; 
@property (nonatomic, assign) BOOL rised_main_view;
@property (nonatomic, assign) BOOL actived_count_down;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil username_string:(NSString *)username_string mobile_string:(NSString *)mobile_string;
- (void)do_init_config;
- (void)do_init_main_view;
- (void)do_init_subviews;
- (void)do_submit;
- (void)do_resend;
- (void)do_cancel;
- (void)do_rise_main_view;
- (void)do_drop_main_view;

- (void)do_show_resend_button;
- (void)do_hide_resend_button;
- (void)do_active_count_down;
- (void)do_unactive_count_down;
@end
