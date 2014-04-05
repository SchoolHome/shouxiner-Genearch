//
//  FXForgetPasswordPanel.h
//  iCouple
//
//  Created by lixiaosong on 12-3-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXShakeField.h"
@protocol FXForgetPasswordDelegate <NSObject>
@optional
- (void)actionForgetPanelWillGetPassword;
- (void)forget_password_did_send_username_string:(NSString *)username_string mobile_string:(NSString *)mobile_string;
- (void)actionForgetPanelDidGetPasswordFailWithErrorString:(NSString *)errorString;
- (void)forget_password_panel_did_hide;
@end

@class FXShakeField;
@interface FXForgetPasswordPanel : UIImageView<FXShakeFieldDelegate>
@property (nonatomic, retain) UILabel * top_label;
@property (nonatomic, retain) FXShakeField * username_field;
@property (nonatomic, retain) FXShakeField * mobile_field;
@property (nonatomic, retain) UIButton * hide_button;
@property (nonatomic, retain) UIButton * country_button;
@property (nonatomic, retain) UIButton * get_code_button;
@property (strong,nonatomic) id<FXForgetPasswordDelegate> delegate;
- (void)doAddObserver;
- (void)doRemoveObserver;
- (void)do_swithc_country_code;
- (void)do_get_check_code;
- (void)do_clear_input_field;
- (void)do_hide;
- (void)do_shake_country_button;
- (void)do_get_focus;
- (void)do_hide_keyboard;
- (void)do_check_input_username_string:(NSString *)username_string mobile_string:(NSString *)mobile_string;

@end
