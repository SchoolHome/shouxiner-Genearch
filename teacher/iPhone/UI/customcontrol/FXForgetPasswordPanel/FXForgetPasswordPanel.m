//
//  FXForgetPasswordPanel.m
//  iCouple
//
//  Created by lixiaosong on 12-3-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXForgetPasswordPanel.h"
#import "FXShakeField.h"
#import "FanxerHeader.h"
#import "FXStringUtil.h"
#import "CPUIModelManagement.h"
#define TOP_LABEL_X 109/2
#define TOP_LABEL_Y 23/2
#define TOP_LABEL_WIDTH 297/2
#define TOP_LABEL_HEIGHT 30/2


#define CLOSE_BUTTON_X 470/2
#define CLOSE_BUTTON_Y 4/2
#define CLOSE_BUTTON_WIDTH 26
#define CLOSE_BUTTON_HEIGHT 26

#define GET_CODE_BUTTON_X 107/2
#define GET_CODE_BUTTON_Y 290/2
#define GET_CODE_BUTTON_WIDTH 308/2
#define GET_CODE_BUTTON_HEIGHT 73/2

#define USERNAME_FIELD_X 51/2
#define USERNAME_FIELD_Y 73/2
#define USERNAME_FIELD_WIDTH 420/2
#define USERNAME_FIELD_HEIGHT 73/2

#define COUNTRY_BUTTON_X 51/2
#define COUNTRY_BUTTON_Y 180/2
#define COUNTRY_BUTTON_WIDTH 129/2
#define COUNTRY_BUTTON_HEIGHT 73/2

#define MOBILE_FIELD_X 195/2
#define MOBILE_FIELD_Y 180/2
#define MOBILE_FIELD_WIDTH 281/2
#define MOBILE_FIELD_HEIGHT 73/2

#define FX_SHAKE_DURATION 0.05
#define FX_SHAKE_REPEATE 3
#define FX_SHAKE_LENGTH 20.0f

#define FX_SHAKE_ALERT_X 388/2
#define FX_SHAKE_ALERT_Y 146/2
#define FX_SHAKE_ALERT_WIDTH 32
#define FX_SHAKE_ALERT_HEIGHT 32

#import "ColorUtil.h"
@implementation FXForgetPasswordPanel
@synthesize top_label = _top_label;
@synthesize username_field = _username_field;
@synthesize mobile_field = _mobile_field;
@synthesize hide_button = _hide_button;
@synthesize country_button = _country_button;
@synthesize get_code_button = _get_code_button;
@synthesize delegate = _delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setUserInteractionEnabled:YES];
        [self setImage:[UIImage imageNamed:FX_LOGIN_IMG_BG]];
        
        UILabel * top_label_temp = [[UILabel alloc] initWithFrame:CGRectMake(TOP_LABEL_X, TOP_LABEL_Y, TOP_LABEL_WIDTH, TOP_LABEL_HEIGHT)];
        [top_label_temp setBackgroundColor:[UIColor clearColor]];
        [top_label_temp setFont:[UIFont boldSystemFontOfSize:13]];
        [top_label_temp setTextColor:[UIColor whiteColor]];
        [top_label_temp setTextAlignment:UITextAlignmentCenter];
        [top_label_temp setText:@"忘记密码了? 重设一个:)"];
        self.top_label = top_label_temp;
        top_label_temp = nil;
        
        FXShakeField * username_field_temp = [[FXShakeField alloc] initWithFrame:CGRectMake(USERNAME_FIELD_X, USERNAME_FIELD_Y, USERNAME_FIELD_WIDTH, USERNAME_FIELD_HEIGHT) ground_image:REGIST_TEXT_BOX_IMG icon_image:REGIST_TXT_MAN_IMG];
        [username_field_temp do_set_text_color:[UIColor blackColor]];
        [username_field_temp do_set_text_font:[UIFont systemFontOfSize:14]];
        [username_field_temp do_set_placeholder_string:@"填写帐号"];
        [username_field_temp do_set_return_type:UIReturnKeyNext];
        [username_field_temp.shake_text_field setKeyboardAppearance:UIKeyboardAppearanceDefault];
        [username_field_temp.shake_text_field setKeyboardType:UIKeyboardTypeASCIICapable];
        [username_field_temp.shake_text_field setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [username_field_temp do_set_background_editing_did_begin_image:REGIST_TEXT_BOX_WHITE_IMG editing_did_end_image:REGIST_TEXT_BOX_IMG];
        [username_field_temp setDelegate:self];
        username_field_temp.edit_limit_int = 30;
        username_field_temp.last_limit_int = 30;
        self.username_field = username_field_temp;
        username_field_temp = nil;
        
        FXShakeField * mobile_field_tmep = [[FXShakeField alloc] initWithFrame:CGRectMake(MOBILE_FIELD_X, MOBILE_FIELD_Y, MOBILE_FIELD_WIDTH, MOBILE_FIELD_HEIGHT) ground_image:REGIST_TEXT_PHONE_IMG icon_image:REGIST_TXT_PHONE_IMG];
        [mobile_field_tmep do_set_text_font:[UIFont systemFontOfSize:14]];
        [mobile_field_tmep do_set_text_color:[UIColor blackColor]];
        [mobile_field_tmep do_set_placeholder_string:@"填写手机号码"];
        [mobile_field_tmep.shake_text_field setKeyboardAppearance:UIKeyboardAppearanceDefault];
        [mobile_field_tmep.shake_text_field setKeyboardType:UIKeyboardTypeNumberPad];
        [mobile_field_tmep.shake_text_field setReturnKeyType:UIReturnKeyDone];
        [mobile_field_tmep do_set_background_editing_did_begin_image:REGIST_TEXT_PHONE_WHITE_IMG editing_did_end_image:REGIST_TEXT_PHONE_IMG];
        mobile_field_tmep.edit_limit_int = 11;
        mobile_field_tmep.last_limit_int = 11;
        [mobile_field_tmep setDelegate:self];
        self.mobile_field = mobile_field_tmep;
        mobile_field_tmep = nil;
        
        
        UIButton * hide_button_temp = [UIButton buttonWithType:UIButtonTypeCustom];
        [hide_button_temp setFrame:CGRectMake(CLOSE_BUTTON_X, CLOSE_BUTTON_Y, CLOSE_BUTTON_WIDTH, CLOSE_BUTTON_HEIGHT)];
        [hide_button_temp setImage:[UIImage imageNamed:FX_LOGIN_IMG_FORGET_CLOSE] forState:UIControlStateNormal];
        [hide_button_temp setImage:[UIImage imageNamed:FX_LOGIN_IMG_FORGET_CLOSE_HOVER] forState:UIControlStateHighlighted];
        [hide_button_temp addTarget:self action:@selector(do_hide) forControlEvents:UIControlEventTouchUpInside];
        self.hide_button = hide_button_temp;
        hide_button_temp = nil;
        
        UIButton * country_button_temp = [UIButton buttonWithType:UIButtonTypeCustom];
        [country_button_temp setFrame:CGRectMake(COUNTRY_BUTTON_X, COUNTRY_BUTTON_Y, COUNTRY_BUTTON_WIDTH, COUNTRY_BUTTON_HEIGHT)];
        [country_button_temp setBackgroundImage:FX_COUNTRY_CODE forState:UIControlStateNormal];
        [country_button_temp setBackgroundImage:FX_COUNTRY_CODE forState:UIControlStateDisabled];
        [country_button_temp setBackgroundImage:FX_COUNTRY_CODE_HOVER forState:UIControlStateHighlighted];
        [country_button_temp setTitleColor:[UIColor colorWithHexString:@"#B6B6B6"] forState:UIControlStateNormal];
        [country_button_temp setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [country_button_temp.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [country_button_temp setTitle:@"+86" forState:UIControlStateNormal];
        [country_button_temp addTarget:self action:@selector(do_swithc_country_code) forControlEvents:UIControlEventTouchUpInside];
        [country_button_temp setEnabled:NO];
        self.country_button = country_button_temp;
        country_button_temp = nil;
        
        
        UIButton * get_code_button_temp = [UIButton buttonWithType:UIButtonTypeCustom];
        [get_code_button_temp setFrame:CGRectMake(GET_CODE_BUTTON_X, GET_CODE_BUTTON_Y, GET_CODE_BUTTON_WIDTH, GET_CODE_BUTTON_HEIGHT)];
        [get_code_button_temp.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
        [get_code_button_temp setTitle:@"获取验证码" forState:UIControlStateNormal];
        [get_code_button_temp setBackgroundImage:[UIImage imageNamed:FX_LOGIN_IMG_ON_GET] forState:UIControlStateNormal];
        [get_code_button_temp setBackgroundImage:[UIImage imageNamed:FX_LOGIN_IMG_ON_GET_HOVER] forState:UIControlStateHighlighted];
        [get_code_button_temp addTarget:self action:@selector(do_get_check_code) forControlEvents:UIControlEventTouchUpInside];
        self.get_code_button = get_code_button_temp;
        get_code_button_temp = nil;
        
        CGPoint mobile_center = self.mobile_field.shake_text_field.center;
        [self.mobile_field.shake_text_field setCenter:CGPointMake(mobile_center.x-3,mobile_center.y)];
        
        [self addSubview:self.top_label];
        [self addSubview:self.username_field];
        [self addSubview:self.mobile_field];
        [self addSubview:self.hide_button];
        [self addSubview:self.country_button];
        [self addSubview:self.get_code_button];
        
 
        CPLogInfo(@"getPwdadd1");
        
    }
    return self;
}
- (void)doAddObserver{
    [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"resetPwdGetCodeResDic" options:0 context:@"resetPwdGetCodeResDic"];
}
- (void)doRemoveObserver{
     [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"resetPwdGetCodeResDic"];
}
- (void)dealloc{
    
}
- (void)removeFromSuperview{
    [super removeFromSuperview];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:@"resetPwdGetCodeResDic"]){
        NSDictionary * resultDict_ = [[CPUIModelManagement sharedInstance] resetPwdGetCodeResDic];
        NSInteger statusCode_ = [[resultDict_ valueForKey:reset_pwd_get_code_res_code] integerValue];
        if(statusCode_ == RESPONSE_CODE_SUCESS){
            [self removeFromSuperview];
            if(self.delegate!=nil){
                CPLogInfo(@"getpwd1");
                [self.delegate forget_password_did_send_username_string:self.username_field.text mobile_string:self.mobile_field.text];
                
            }
        }
        else{
            NSString * statusDes_ = [resultDict_ valueForKey:reset_pwd_get_code_res_desc];
            CPLogInfo(@"des:%@",statusDes_);
            if(self.delegate != nil){
                [self.delegate actionForgetPanelDidGetPasswordFailWithErrorString:statusDes_];
            }
        }
    }
    else{
        return;
    }
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
#pragma mark Action
- (void)do_get_check_code{
    NSString * username_string =  self.username_field.text;
    NSString * mobile_string = self.mobile_field.text;
    [self do_check_input_username_string:username_string mobile_string:mobile_string];
    BOOL result_bool = [FXStringUtil do_check_is_mobile_string:mobile_string];
    if([username_string length]>0&&[mobile_string length]>0&&result_bool==YES){
        if([[CPUIModelManagement sharedInstance] canConnectToNetwork]){
            [self.username_field do_hide_keyboard];
            [self.mobile_field do_hide_keyboard];
            [[CPUIModelManagement sharedInstance] resetPasswordGetCodeWithUserName:username_string andMobileNumber:mobile_string];
            if(self.delegate != nil){
                [self.delegate actionForgetPanelWillGetPassword];
            }
        }
        else{
            return;
        }
    }
}

- (void)do_get_focus{
    [self.username_field becomeFirstResponder];
}
- (void)do_hide{
    [self do_clear_input_field];
    [self.username_field do_hide_keyboard];
    [self.mobile_field do_hide_keyboard];
    [self.delegate forget_password_panel_did_hide];
}
- (void)do_check_input_username_string:(NSString *)username_string mobile_string:(NSString *)mobile_string{
    if([username_string length]<=0){
        [self.username_field do_shake];
        [self.username_field do_show_alert];
        [self.username_field do_show_tip_info_string:@"用户名不能为空"];
        [self.username_field do_hide_keyboard];
        [self do_shake_country_button];
    }
    BOOL result_bool = [FXStringUtil do_check_is_mobile_string:mobile_string];
    if(result_bool == NO){
        [self.mobile_field do_shake];
        [self.mobile_field do_show_alert];
        [self.mobile_field do_show_tip_info_string:@"请输入11位手机号码"];
        [self.mobile_field do_hide_keyboard];
        [self do_shake_country_button];
    }
}
- (void)do_hide_keyboard{
    [self.username_field do_hide_keyboard];
    [self.mobile_field do_hide_keyboard];
}
- (void)do_clear_input_field{
    [self.username_field setText:@""];
    [self.mobile_field setText:@""];
    [self.username_field do_hide_input_alert];
    [self.mobile_field do_hide_input_alert];
}
- (void)do_swithc_country_code{

}
- (void)do_shake_country_button{
    CABasicAnimation *animation = 
    [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:FX_SHAKE_DURATION];
    [animation setRepeatCount:FX_SHAKE_REPEATE];
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint:
                             CGPointMake([self.country_button center].x - FX_SHAKE_LENGTH, [self.country_button center].y)]];
    [animation setToValue:[NSValue valueWithCGPoint:
                           CGPointMake([self.country_button center].x + FX_SHAKE_LENGTH, [self.country_button center].y)]];
    [[self.country_button layer] addAnimation:animation forKey:@"position"];
}
#pragma mark FXShakeFieldDelegate
- (void)shake_field_did_begin_editing:(UITextField *)text_field{
    if([text_field isEqual:self.username_field.shake_text_field]){
        [self.username_field do_hide_tip];
        [self.username_field do_hide_alert];
        
    }
    else if([text_field isEqual:self.mobile_field.shake_text_field]){
        [self.mobile_field do_hide_tip];
        [self.mobile_field do_hide_alert];
       
    }
}
- (void)shake_field_did_end_editing:(UITextField *)text_field{
    if([text_field isEqual:self.username_field.shake_text_field]){
        NSString * username_string = self.username_field.text;
        if([username_string  length]<=0){
            [self.username_field do_shake];
            [self.username_field do_show_alert];
            [self.username_field do_show_tip_info_string:@"用户名不能为空"];
            [self.username_field do_hide_keyboard];
            [self do_shake_country_button];
        }
    }
    else if([text_field isEqual:self.mobile_field.shake_text_field]){
        NSString * mobile_string = self.mobile_field.text;
        BOOL result_bool = [FXStringUtil do_check_is_mobile_string:mobile_string];
        if(result_bool == NO){
            [self.mobile_field do_shake];
            [self.mobile_field do_show_alert];
            [self.mobile_field do_show_tip_info_string:@"请输入11位手机号码"];
            [self.mobile_field do_hide_keyboard];
            [self do_shake_country_button];
        }
    }

    
}
- (void)shake_field_should_return:(UITextField *)text_field{
    if([text_field isEqual:self.username_field.shake_text_field]){
        [self.mobile_field do_show_keyboard];
    }
}
- (void)shake_field_did_text_edit:(UITextField *)text_field{
    
}

@end
