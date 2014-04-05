//
//  VerifyViewCodeController.h
//  iCouple
//
//  Created by 振杰 李 on 12-3-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


#import "GeneralViewController.h"
#import "NavigationBothStyle.h"
#import "FanxerNavigationBarControl.h"
#import "VerifyViewCodeController.h"
#import "FxProcessFixed.h"
#import "FXShakeField.h"
#import "FXChangeMobilePanel.h"
#import "LoginViewController.h"
#import "FXCountDown.h"
@class FXVideoView;
@class FXMobilePanel;
@class FXShakeField;
@class FXCountDown;
@class CPUIModelManagement;
@protocol FXTopTipPanelDelegate;
@interface VerifyViewCodeController : GeneralViewController<FanxerNavigationBarDelegate,FXShakeFieldDelegate,FXChangeMobilePanelDelegate,FXCountDownDelegate,FXTopTipPanelDelegate>{
    
    FanxerNavigationBarControl *fnav;
    FxProcessFixed *process;
    
    
    UIImageView * top_image_view;
    UIView * body_view;
    FXVideoView * video_view;
    FXMobilePanel * mobile_panel;
    FXShakeField * code_field;
    FXCountDown * count_down;
    UIButton * resend_button;
    UIImageView * bottom_view;
    UIButton * change_mobile_number_button;
    UIButton * launch_button;
    UIButton * regist_button;
    FXChangeMobilePanel * change_mobile_panel;

    CPUIModelManagement * model_management;
    BOOL rised_main_view;
    BOOL rised_change_mobile;
    BOOL rised_count_down;
    BOOL have_mobile;
    BOOL rised_mobile_info_panel;
}
@property (nonatomic, strong) NSString * end_region_string;
@property (nonatomic, strong) NSString * end_mobile_string;
@property (nonatomic, strong) NSString * end_verify_string;
@property (nonatomic, strong) UIImage * end_top_image;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil region_string:(NSString *)region_string mobile_string:(NSString *)mobile_string top_image:(UIImage *)top_image;

- (void)do_init_config;
- (void)do_set_subview_align_center;

- (void)loadNav;
- (void)do_init_main_view;
- (void)do_init_top_image_view;
- (void)do_init_top_control_view;
- (void)do_init_body_view;
- (void)do_init_body_subview;
- (void)do_load_top_image_view;
- (void)do_load_top_control_view;
- (void)do_load_body_view;
- (void)do_load_body_subview;


- (void)do_active_count_down;
- (void)do_unactive_count_down;
- (void)do_reset_count_down;

- (void)do_add_observer;
- (void)do_remove_observer;

- (void)do_init_change_mobile_panel;
- (void)do_destory_change_mobile_panel;
- (void)do_show_change_mobile_panel;
- (void)do_hide_change_mobile_panel;

- (void)do_show_mobile_info_panel;
- (void)do_hide_mobile_info_panel;
- (void)do_set_mobile_info_panel;

- (void)do_rise_body_view;
- (void)do_drop_body_view;
- (void)do_lock_main_view;
- (void)do_unlock_main_view;


- (void)do_ui_action_change_mobile_number;
- (void)do_ui_action_resend_verify_code;
- (void)do_ui_action_launch;
- (void)do_ui_action_regist;


- (void)do_data_action_active_user;
- (void)do_data_action_bind_user;

@end
