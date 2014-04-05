//
//  FXChangeMobilePanel.m
//  iCouple
//
//  Created by lixiaosong on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


#define VERIFY_MOBILE_PANEL_RECT (46/2,46/2,411/2,35/2)
#define VERIFY_CHANGE_COUNTRY_BUTTON_RECT (43/2,118/2,131/2,74/2)
#define VERIFY_MOBILE_FIELD_RECT (187/2,118/2,278/2,73/2)
#define VERIFY_VERIFY_CODE_BUTTON_RECT (102/2,233/2,310/2,75/2)

#define VERIFY_MOBILE_PANEL_X 46/2
#define VERIFY_MOBILE_PANEL_Y 46/2
#define VERIFY_MOBILE_PANEL_WIDTH 411/2
#define VERIFY_MOBILE_PANEL_HEIGHT 35/2

#define VERIFY_CHANGE_COUNTRY_BUTTON_X 43/2
#define VERIFY_CHANGE_COUNTRY_BUTTON_Y 118/2
#define VERIFY_CHANGE_COUNTRY_BUTTON_WIDTH 131/2
#define VERIFY_CHANGE_COUNTRY_BUTTON_HEIGHT 74/2

#define VERIFY_MOBILE_FIELD_X 187/2
#define VERIFY_MOBILE_FIELD_Y 118/2
#define VERIFY_MOBILE_FIELD_WIDTH 278/2
#define VERIFY_MOBILE_FIELD_HEIGHT 73/2

#define VERIFY_VERIFY_CODE_BUTTON_X 102/2
#define VERIFY_VERIFY_CODE_BUTTON_Y 233/2
#define VERIFY_VERIFY_CODE_BUTTON_WIDTH 310/2
#define VERIFY_VERIFY_CODE_BUTTON_HEIGHT 75/2

#define CLOSE_BUTTON_X 457/2
#define CLOSE_BUTTON_Y 10/2
#define CLOSE_BUTTON_WIDTH 49/2
#define CLOSE_BUTTON_HEIGHT 49/2

#define FX_SHAKE_DURATION 0.05
#define FX_SHAKE_REPEATE 3
#define FX_SHAKE_LENGTH 20.0f

#import "FXChangeMobilePanel.h"
#import "FXShakeField.h"
#import "FXMobilePanel.h"
#import "FanxerHeader.h"
#import "FXStringUtil.h"
#import "ColorUtil.h"
#import "CPUIModelManagement.h"
@implementation FXChangeMobilePanel
@synthesize top_label = _top_label;
@synthesize change_country_button = _change_country_button;
@synthesize mobile_field = _mobile_field;
@synthesize verify_code_button = _verify_code_button;
@synthesize hide_button = _hide_button;
@synthesize delegate = _delegate;
@synthesize end_region_string = _end_region_string;
@synthesize end_mobile_string = _end_mobile_string;
@synthesize end_info_string = _end_info_string;
@synthesize end_button_string = _end_button_string;
@synthesize rised_alert = _rised_alert;
@synthesize rised_tip = _rised_tip;
@synthesize have_mobile = _have_mobile;
- (id)initWithFrame:(CGRect)frame region_string:(NSString *)region_string mobile_string:(NSString *)mobile_string
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
       
        self.end_region_string = @"+86";
    
            
        if(mobile_string != nil){
            self.have_mobile = YES;
            self.end_mobile_string = mobile_string;
        }
        else{
            self.have_mobile = NO;

        }

        if(self.have_mobile == YES){
            self.end_info_string = [NSString stringWithFormat:@"将号码 +86 %@ 改为",self.end_mobile_string];
            self.end_button_string = [NSString stringWithFormat:@"重新获取验证码"];
        }
        else{
            self.end_info_string = [NSString stringWithFormat:@"请输入希望绑定的手机号"];
            self.end_button_string = [NSString stringWithFormat:@"获取验证码"];
        }
        
        [self do_init_config];
        [self do_init_subviews];
    }
    return self;
}

- (void)do_init_config{
    self.rised_alert = NO;
    self.rised_tip = NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)do_init_subviews{
    
    [self setUserInteractionEnabled:YES];
    [self setImage:[UIImage imageNamed:FX_LOGIN_IMG_BG]];
    
    UILabel * top_label_temp = [[UILabel alloc] initWithFrame:CGRectMake(VERIFY_MOBILE_PANEL_X, VERIFY_MOBILE_PANEL_Y, VERIFY_MOBILE_PANEL_WIDTH, VERIFY_MOBILE_PANEL_HEIGHT)];
    [top_label_temp setBackgroundColor:[UIColor clearColor]];
    [top_label_temp setTextColor:[UIColor whiteColor]];
    [top_label_temp setTextAlignment:UITextAlignmentCenter];
    [top_label_temp setFont:[UIFont systemFontOfSize:15]];
    [top_label_temp setText:self.end_info_string];
    self.top_label = top_label_temp;
    top_label_temp = nil;
    
    
    UIImage * change_country_image = FX_COUNTRY_CODE;
    UIImage * change_country_image_hover = FX_COUNTRY_CODE_HOVER;
    CGImageRef change_country_image_ref = [change_country_image CGImage];
    CGFloat change_country_image_w = CGImageGetWidth(change_country_image_ref);
    CGFloat change_country_image_h = CGImageGetHeight(change_country_image_ref);
    UIButton * change_country_button_temp = [UIButton buttonWithType:UIButtonTypeCustom];
    [change_country_button_temp setFrame:CGRectMake(VERIFY_CHANGE_COUNTRY_BUTTON_X, VERIFY_CHANGE_COUNTRY_BUTTON_Y, change_country_image_w/2, change_country_image_h/2)];
    [change_country_button_temp.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [change_country_button_temp setTitle:@"+86" forState:UIControlStateNormal];
    [change_country_button_temp setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [change_country_button_temp setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [change_country_button_temp setBackgroundImage:change_country_image forState:UIControlStateNormal];
    [change_country_button_temp setBackgroundImage:change_country_image forState:UIControlStateDisabled];
    [change_country_button_temp setBackgroundImage:change_country_image_hover forState:UIControlStateHighlighted];
    [change_country_button_temp setEnabled:NO];
    self.change_country_button = change_country_button_temp;
    change_country_button_temp = nil;
    

    FXShakeField * mobile_field_temp = [[FXShakeField alloc] initWithFrame:CGRectMake(VERIFY_MOBILE_FIELD_X, VERIFY_MOBILE_FIELD_Y, VERIFY_MOBILE_FIELD_WIDTH, VERIFY_MOBILE_FIELD_HEIGHT) ground_image:REGIST_TEXT_PHONE_IMG icon_image:REGIST_TXT_PHONE_IMG];
    [mobile_field_temp.shake_text_field setContentMode:UIViewContentModeScaleAspectFill];
    //[mobile_field_temp.shake_text_field setBackgroundColor:[UIColor redColor]];
    //CGPoint mobile_shake_field_center = mobile_field_temp.center;
    //[mobile_field_temp.shake_text_field setCenter:CGPointMake(mobile_shake_field_center.x, mobile_shake_field_center.y+5)];
    //CGRect content_stetch = mobile_field_temp.shake_text_field.contentStretch;
    //CGFloat content_stretch = mobile_field_temp.shake_text_field.contentScaleFactor;
    //[mobile_field_temp.shake_text_field setContentStretch:CGRectMake(content_stetch.origin.x, content_stetch.origin.y-3, content_stetch.size.width, content_stetch.size.height)];
    CGRect field_frame = mobile_field_temp.shake_text_field.frame;
    [mobile_field_temp.shake_text_field setFrame:CGRectMake(field_frame.origin.x+3, field_frame.origin.y-3, field_frame.size.width, field_frame.size.height)];
    [mobile_field_temp do_set_keyboard_appearance:UIKeyboardAppearanceDefault];
    [mobile_field_temp do_set_keyboard_type:UIKeyboardTypeNumberPad];
    [mobile_field_temp do_set_return_type:UIReturnKeyDone];
    [mobile_field_temp do_set_text_alignment:UITextAlignmentLeft];
    [mobile_field_temp do_set_text_font:[UIFont systemFontOfSize:14]];
    [mobile_field_temp.shake_text_field setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [mobile_field_temp do_set_background_editing_did_begin_image:REGIST_TEXT_PHONE_WHITE_IMG editing_did_end_image:REGIST_TEXT_PHONE_IMG];
    mobile_field_temp.edit_limit_int= 11;
    mobile_field_temp.last_limit_int = 11;
    [mobile_field_temp do_set_placeholder_string:@"输入手机号码"];
    CGPoint mobile_center = mobile_field_temp.shake_text_field.center;
    [mobile_field_temp.shake_text_field setCenter:CGPointMake(mobile_center.x-10, mobile_center.y)];
    [mobile_field_temp setDelegate:self];
    self.mobile_field = mobile_field_temp;
    mobile_field_temp = nil;
    
   
    
    UIImage * hide_button_image = [UIImage imageNamed:FX_LOGIN_IMG_FORGET_CLOSE];
    UIImage * hide_button_image_hover = [UIImage imageNamed:FX_LOGIN_IMG_FORGET_CLOSE_HOVER];
    CGImageRef hide_button_image_ref = [hide_button_image CGImage];
    CGFloat hide_button_image_w = CGImageGetWidth(hide_button_image_ref);
    CGFloat hide_button_image_h = CGImageGetHeight(hide_button_image_ref);
    UIButton * hide_button_temp = [UIButton buttonWithType:UIButtonTypeCustom];
    [hide_button_temp setFrame:CGRectMake(CLOSE_BUTTON_X, CLOSE_BUTTON_Y, hide_button_image_w/2, hide_button_image_h/2)];
    [hide_button_temp setImage:hide_button_image forState:UIControlStateNormal];
    [hide_button_temp setImage:hide_button_image_hover forState:UIControlStateHighlighted];
    [hide_button_temp addTarget:self action:@selector(do_ui_action_close) forControlEvents:UIControlEventTouchUpInside];
    self.hide_button = hide_button_temp;
    hide_button_temp = nil;
    
    
    
    UIImage * verify_code_image = [UIImage imageNamed:FX_LOGIN_IMG_ON_GET];
    UIImage * verify_code_image_hover = [UIImage imageNamed:FX_LOGIN_IMG_ON_GET_HOVER];
    CGImageRef verify_code_image_ref = [verify_code_image CGImage];
    CGFloat verify_code_image_w = CGImageGetWidth(verify_code_image_ref);
    CGFloat verify_code_image_h = CGImageGetHeight(verify_code_image_ref);
    UIButton * verify_code_button_temp = [UIButton buttonWithType:UIButtonTypeCustom];
    [verify_code_button_temp setFrame:CGRectMake(VERIFY_VERIFY_CODE_BUTTON_X, VERIFY_VERIFY_CODE_BUTTON_Y, verify_code_image_w/2, verify_code_image_h/2)];
    [verify_code_button_temp setTitle:self.end_button_string forState:UIControlStateNormal];
    [verify_code_button_temp setBackgroundImage:verify_code_image forState:UIControlStateNormal];
    [verify_code_button_temp setBackgroundImage:verify_code_image_hover forState:UIControlStateHighlighted];
    [verify_code_button_temp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [verify_code_button_temp setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [verify_code_button_temp.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [verify_code_button_temp addTarget:self action:@selector(do_ui_action_pass_moble_string) forControlEvents:UIControlEventTouchUpInside];
    self.verify_code_button = verify_code_button_temp;
    verify_code_button_temp = nil;
    
    [self addSubview:self.top_label];
    [self addSubview:self.change_country_button];
    [self addSubview:self.mobile_field];
    [self addSubview:self.verify_code_button];
    
    if(self.have_mobile == YES){
        [self addSubview:self.hide_button];
    }
}
#pragma mark Action
- (void)do_ui_action_pass_moble_string{
        self.end_mobile_string = self.mobile_field.text;
        if([FXStringUtil do_check_is_mobile_string:self.end_mobile_string]==NO){
            [self do_shake_country_button];
            [self.mobile_field do_shake];
            [self.mobile_field do_show_alert];
            [self.mobile_field do_show_tip_info_string:@"请输入11位手机号"];
        }
        else{
            self.end_region_string = @"86";
            [self.delegate action_change_mobile_panel_did_pass_region_string:self.end_region_string mobile_string:self.end_mobile_string];
        }
        [self.mobile_field do_hide_keyboard];
}
- (void)do_ui_action_close{
    [self.delegate action_change_mobile_panel_did_close];
}
- (void)do_shake_country_button{
    CABasicAnimation *animation = 
    [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:FX_SHAKE_DURATION];
    [animation setRepeatCount:FX_SHAKE_REPEATE];
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint:
                             CGPointMake([self.change_country_button center].x - FX_SHAKE_LENGTH, [self.change_country_button center].y)]];
    [animation setToValue:[NSValue valueWithCGPoint:
                           CGPointMake([self.change_country_button center].x + FX_SHAKE_LENGTH, [self.change_country_button center].y)]];
    [[self.change_country_button layer] addAnimation:animation forKey:@"position"];

}

#pragma mark FXShakeFieldDelegate
- (void)shake_field_did_begin_editing:(UITextField *)text_field{
    [self.mobile_field do_hide_tip];
    [self.mobile_field do_hide_alert];
}
- (void)shake_field_did_end_editing:(UITextField *)text_field{
    
}
- (void)shake_field_should_return:(UITextField *)text_field{
    
}
- (void)shake_field_did_text_edit:(UITextField *)text_field{
    
}
@end
