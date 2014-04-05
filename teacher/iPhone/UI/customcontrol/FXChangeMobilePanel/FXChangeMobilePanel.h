//
//  FXChangeMobilePanel.h
//  iCouple
//
//  Created by lixiaosong on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXShakeField.h"
@protocol FXChangeMobilePanelDelegate
- (void)action_change_mobile_panel_did_close;
- (void)action_change_mobile_panel_did_pass_region_string:(NSString *)region_string mobile_string:(NSString *)mobile_string;
@end
@class FXShakeField;
@class CPUIModelManagement;
@interface FXChangeMobilePanel : UIImageView<FXShakeFieldDelegate>{
    CPUIModelManagement * model_management;
}
@property (strong,nonatomic) UILabel * top_label;
@property (strong,nonatomic) UIButton * change_country_button;
@property (strong,nonatomic) FXShakeField * mobile_field;
@property (strong,nonatomic) UIButton * verify_code_button;
@property (strong,nonatomic) UIButton * hide_button;
@property (strong,nonatomic) id<FXChangeMobilePanelDelegate>delegate;
@property (strong,nonatomic) NSString * end_region_string;
@property (strong,nonatomic) NSString * end_mobile_string;
@property (strong,nonatomic) NSString * end_info_string;
@property (strong,nonatomic) NSString * end_button_string;
@property (assign,nonatomic) BOOL rised_alert;
@property (assign,nonatomic) BOOL rised_tip;
@property (assign,nonatomic) BOOL have_mobile;

- (id)initWithFrame:(CGRect)frame region_string:(NSString *)region_string mobile_string:(NSString *)mobile_string;
- (void)do_init_config;
- (void)do_init_subviews;
- (void)do_shake_country_button;

- (void)do_ui_action_pass_moble_string;
- (void)do_ui_action_close;


@end
