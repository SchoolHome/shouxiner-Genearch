//
//  LoginViewController.h
//  iCouple
//
//  Created by 振杰 李 on 12-3-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GeneralViewController.h"

#import "NavigationBothStyle.h"
#import "FanxerNavigationBarControl.h"

#import "RegistFirstViewController.h"
#import "FxProcessFixed.h"
#import "FXForgetPasswordPanel.h"
#import "FXShakeField.h"
#import "RegistHelper.h"
#import "FXTopTipPanelDelegate.h"
@class RegistFirstViewController;
@class FXForgetPasswordPanel;
@class FanxerIndicatorControl;
@class FXTopTipPanel;
@class CPUIModelManagement;
@interface LoginViewController : GeneralViewController <FanxerNavigationBarDelegate,FXForgetPasswordDelegate,FXShakeFieldDelegate,FXTopTipPanelDelegate>{
    FanxerNavigationBarControl *fnav;
    
    UIControl * body_view;
    
    
    UIImageView * _topBgImageView;
    UIImageView * _shuangImageView;
    UIImageView * _logo_image_view;
    
    FXShakeField * username_field;
    FXShakeField * password_field;
    UIButton * login_button;
    UIButton * regist_button;
    UIButton * forget_password_button;
    FXForgetPasswordPanel * forget_password_panel;
    
    BOOL rised_forget_panel;
    BOOL rised_toptip;
    BOOL rised_loading;

    
    CPUIModelManagement * model_management;
}
@property (strong,nonatomic) FanxerNavigationBarControl *fnav;
@property (nonatomic, copy) NSString * username_string;
@property (nonatomic, copy) NSString * password_string;
-(void)loadNav;
- (void)do_init_config;
- (void)do_init_main_view;
- (void)do_rise_main_view;
- (void)do_drop_main_view;
- (void)do_respond_tap_main_view;

- (void)do_init_body_view;
- (void)do_load_body_view;
- (void)do_respond_tap_body_view;

- (void)do_init_subviews;             
- (void)do_load_subviews;


- (void)do_add_observer;
- (void)do_remove_observer;

- (void)do_init_forget_password_panel;
- (void)do_destory_forget_password_panel;
- (void)do_show_forget_password_panel;
- (void)do_hide_forget_password_panel;

- (void)do_hide_keyboard;
- (void)do_lock_main_view;
- (void)do_unlock_main_view;

- (void)do_ui_action_login;
- (void)do_ui_action_regist;
- (void)do_ui_action_find_password;

- (void)do_goto_ground;
- (void)do_goto_verify;
- (void)do_goto_forget;

- (void)do_data_action_login;

@end
