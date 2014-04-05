//
//  ForgetViewController.m
//  iCouple
//
//  Created by lixiaosong on 12-3-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ForgetViewController.h"
#import "FXMobilePanel.h"
#import "FXShakeField.h"
#import "FXCountDown.h"
#import "FanxerHeader.h"
#import "ColorUtil.h"
#import "FXTopTipPanel.h"
#import "CPUIModelManagement.h"

#define FORGET_MAIN_VIEW_X 0
#define FORGET_MAIN_VIEW_Y 0
#define FORGET_MAIN_VIEW_W 320
#define FORGET_MAIN_VIEW_H 460

#define FORGET_MOBILE_PANEL_X 0
#define FORGET_MOBILE_PANEL_Y 45/2
#define FORGET_MOBILE_PANEL_WIDTH 320
#define FORGET_MOBILE_PANEL_HEIGHT 26/2

#define FORGET_PASSWORD_FIELD_X 108/2
#define FORGET_PASSWORD_FIELD_Y 91/2+10
#define FORGET_PASSWORD_FIELD_WIDTH 421/2
#define FORGET_PASSWORD_FIELD_HEIGHT 75/2

#define FORGET_VERIFY_CODE_FIELD_X 108/2
#define FORGET_VERIFY_CODE_FIELD_Y 171/2+20
#define FORGET_VERIFY_CODE_FIELD_WIDTH 421/2
#define FORGET_VERIFY_CODE_FIELD_HEIGHT 75/2

#define FORGET_COUNT_DOWN_X 236/2
#define FORGET_COUNT_DOWN_Y 267/2+20
#define FORGET_COUNT_DOWN_WIDTH 180/2
#define FORGET_COUNT_DOWN_HEIGHT 26/2

#define FORGET_RESEND_BUTTON_X 204/2
#define FORGET_RESEND_BUTTON_Y 267/2+20
#define FORGET_RESEND_BUTTON_W 231/2
#define FORGET_RESEND_BUTTON_H 59/2

#define FORGET_SUBMIT_BUTTON_X 110/2
#define FORGET_SUBMIT_BUTTON_Y 321/2+20
#define FORGET_SUBMIT_BUTTON_W 217/2
#define FORGET_SUBMIT_BUTTON_H 74/2

#define FORGET_CANCEL_BUTTON_X 342/2
#define FORGET_CANCEL_BUTTON_Y 321/2+20
#define FORGET_CANCEL_BUTTON_W 186/2
#define FORGET_CANCEL_BUTTON_H 75/2

#define FORGET_STATUS_H 20
#define FORGET_MAIN_VIEW_RISE_H 100
#define FORGET_MAIN_VIEW_ANIMATION_DURATION 0.6
#define FORGET_TIMEOUT_INTERVAL 60
#import "CPUIModelManagement.h"
@implementation ForgetViewController
@synthesize mobiel_panel = _mobiel_panel;
@synthesize password_field = _password_field;
@synthesize verify_code_field = _verify_code_field;
@synthesize count_down = _count_down;
@synthesize submit_button = _submit_button;
@synthesize resend_button = _resend_button;
@synthesize cancel_button = _cancel_button;
@synthesize end_username_string = _end_username_string;
@synthesize end_mobile_string = _end_mobile_string;
@synthesize rised_main_view = _rised_main_view;
@synthesize actived_count_down = _actived_count_down;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil username_string:(NSString *)username_string mobile_string:(NSString *)mobile_string
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.end_username_string = username_string;
        self.end_mobile_string = mobile_string;
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
#pragma mark init config
- (void)do_init_config{
    self.rised_main_view = NO;
    self.actived_count_down = NO;
}
#pragma mark init subviews
- (void)do_init_main_view{
    UIView * main_view_temp = [[UIView alloc] initWithFrame:CGRectMake(FORGET_MAIN_VIEW_X, FORGET_MAIN_VIEW_Y, FORGET_MAIN_VIEW_W, FORGET_MAIN_VIEW_H)];
    [main_view_temp setBackgroundColor:[UIColor colorWithHexString:@"#FFFEF6"]];
    self.view = main_view_temp;
    main_view_temp = nil;
}
- (void)do_init_subviews{    
    FXMobilePanel * mobile_panel_temp = [[FXMobilePanel alloc] initWithFrame:CGRectMake(FORGET_MOBILE_PANEL_X, FORGET_MOBILE_PANEL_Y, FORGET_MOBILE_PANEL_WIDTH, FORGET_MOBILE_PANEL_HEIGHT)];
    [mobile_panel_temp.info_label_left setText:@"已经往手机号"];
    [mobile_panel_temp.info_label_number setText:self.end_mobile_string];
    [mobile_panel_temp.info_label_right setText:@"发送验证码"];
    self.mobiel_panel = mobile_panel_temp;
    mobile_panel_temp = nil;
    
    FXShakeField * password_field_temp = [[FXShakeField alloc] initWithFrame:CGRectMake(FORGET_PASSWORD_FIELD_X, FORGET_PASSWORD_FIELD_Y, FORGET_PASSWORD_FIELD_WIDTH, FORGET_PASSWORD_FIELD_HEIGHT) ground_image:REGIST_TXT_INPUT_IMG icon_image:REGIST_TXT_KEY_IMG];
    [password_field_temp.shake_text_field setPlaceholder:@"填写新密码"];
    [password_field_temp do_set_text_secured:YES];
    [password_field_temp setKeyBoardReturnType:UIReturnKeyNext];
    [password_field_temp do_set_background_editing_did_begin_image:REGIST_TEXT_BOX_WHITE_IMG editing_did_end_image:REGIST_TEXT_BOX_IMG];
    [password_field_temp setDelegate:self];
    self.password_field = password_field_temp;
    password_field_temp = nil;
    
    FXShakeField * verify_code_field_temp = [[FXShakeField alloc] initWithFrame:CGRectMake(FORGET_VERIFY_CODE_FIELD_X, FORGET_VERIFY_CODE_FIELD_Y, FORGET_VERIFY_CODE_FIELD_WIDTH, FORGET_VERIFY_CODE_FIELD_HEIGHT) ground_image:REGIST_TXT_INPUT_IMG icon_image:[UIImage imageNamed:FX_LOGIN_IMG_ICON_EYE]];
    [verify_code_field_temp do_set_placeholder_string:@"填写验证码"];
    [verify_code_field_temp.shake_text_field setKeyboardType:UIKeyboardTypeASCIICapable];
    //[verify_code_field_temp setKeyBoardReturnType:UIReturnKeyDone];
    [verify_code_field_temp do_set_background_editing_did_begin_image:REGIST_TEXT_BOX_WHITE_IMG editing_did_end_image:REGIST_TEXT_BOX_IMG];
    [verify_code_field_temp setDelegate:self];
    self.verify_code_field = verify_code_field_temp;
    verify_code_field_temp = nil;
    
    FXCountDown * count_down_temp = [[FXCountDown alloc] initWithFrame:CGRectMake(FORGET_COUNT_DOWN_X, FORGET_COUNT_DOWN_Y, FORGET_COUNT_DOWN_WIDTH, FORGET_COUNT_DOWN_HEIGHT) beginNum:FORGET_TIMEOUT_INTERVAL interval:1 txtColor:[UIColor blackColor] disKey:@"s"];
    [count_down_temp setDelegate:self];
    self.count_down = count_down_temp;
    count_down_temp = nil;
    
    
    
    UIButton * submit_button_temp = [UIButton buttonWithType:UIButtonTypeCustom];
    [submit_button_temp setFrame:CGRectMake(FORGET_SUBMIT_BUTTON_X, FORGET_SUBMIT_BUTTON_Y, FORGET_SUBMIT_BUTTON_W, FORGET_SUBMIT_BUTTON_H)];
    [submit_button_temp setTitle:@"提交" forState:UIControlStateNormal];
    [submit_button_temp setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    [submit_button_temp setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [submit_button_temp setBackgroundImage:[UIImage imageNamed:FX_LOGIN_IMG_FORGET_SUB] forState:UIControlStateNormal];
    [submit_button_temp setBackgroundImage:[UIImage imageNamed:FX_LOGIN_IMG_FORGET_SUB_HOVER] forState:UIControlStateHighlighted];
    [submit_button_temp addTarget:self action:@selector(do_submit) forControlEvents:UIControlEventTouchUpInside];
    self.submit_button = submit_button_temp;
    submit_button_temp = nil;
    
    UIButton * resend_button_temp = [UIButton buttonWithType:UIButtonTypeCustom];
    [resend_button_temp setFrame:CGRectMake(FORGET_RESEND_BUTTON_X, FORGET_RESEND_BUTTON_Y-5, FORGET_RESEND_BUTTON_W, FORGET_RESEND_BUTTON_H)];
    [resend_button_temp.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [resend_button_temp setTitle:@"重新获取验证码" forState:UIControlStateNormal];
    [resend_button_temp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [resend_button_temp setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [resend_button_temp setBackgroundImage:[UIImage imageNamed:FX_LOGIN_IMG_FORGET_GET] forState:UIControlStateNormal];
    [resend_button_temp setBackgroundImage:[UIImage imageNamed:FX_LOGIN_IMG_FORGET_GET_HOVER] forState:UIControlStateHighlighted];
    [resend_button_temp addTarget:self action:@selector(do_resend) forControlEvents:UIControlEventTouchUpInside];
    self.resend_button = resend_button_temp;
    resend_button_temp = nil;
    
    
    
    UIButton * cancel_button_temp = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancel_button_temp setFrame:CGRectMake(FORGET_CANCEL_BUTTON_X, FORGET_CANCEL_BUTTON_Y, FORGET_CANCEL_BUTTON_W, FORGET_CANCEL_BUTTON_H)];
    [cancel_button_temp setBackgroundImage:[UIImage imageNamed:FX_LOGIN_IMG_SIGN] forState:UIControlStateNormal];
    [cancel_button_temp setBackgroundImage:[UIImage imageNamed:FX_LOGIN_IMG_SIGN_HOVER] forState:UIControlStateHighlighted];
    [cancel_button_temp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancel_button_temp setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [cancel_button_temp setTitle:@"取消" forState:UIControlStateNormal];
    [cancel_button_temp setTitle:@"取消" forState:UIControlStateHighlighted];
    [cancel_button_temp addTarget:self action:@selector(do_cancel) forControlEvents:UIControlEventTouchUpInside];
    self.cancel_button = cancel_button_temp;
    cancel_button_temp = nil;
    
    [self.view addSubview:self.mobiel_panel];
    [self.view addSubview:self.password_field];
    [self.view addSubview:self.verify_code_field];
    [self.view addSubview:self.count_down];
    [self.view addSubview:self.submit_button];
    [self.view addSubview:self.cancel_button];
    
}
#pragma mark toptipview
- (void)do_init_toptip_view{
    [super do_init_toptip_view];
    [toptippanel setDelegate:self];

}
- (void)action_toptip_did_show{
    
}
- (void)action_toptip_did_hide{
    
}
#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [self do_init_config];
    [self do_init_main_view];
    [self do_init_subviews];
    
    [self do_active_count_down];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"resetPwdPostResDic" options:0 context:@"resetPwdPostResDic"];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"resetPwdPostResDic"];
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if([keyPath isEqualToString:@"resetPwdPostResDic"]){
        [self do_hide_loading_view];
        NSDictionary * resultDict_ = [[CPUIModelManagement sharedInstance] resetPwdPostResDic];
        NSInteger statusCode_ = [[resultDict_ valueForKey:reset_pwd_post_res_code] integerValue];
        if(statusCode_ == RESPONSE_CODE_SUCESS){
            [self.navigationController popViewControllerAnimated:YES];
        }
        else{
            NSString * statusDes_ = [resultDict_ valueForKey:reset_pwd_post_res_desc];
            CPLogInfo(@"des:%@",statusDes_);
            [self do_show_toptip_view_toptip_string:statusDes_];
        }
    }
    else{
        return;
    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark Action
- (void)do_submit{
    NSString * password_string = self.password_field.text;
    NSString * verify_string = self.verify_code_field.text;
    if([password_string length]<=0){
        [self.password_field do_shake];
    }
    if([verify_string length]<=0){
        [self.verify_code_field do_shake];
    }    
    
    if([verify_string length]>0&&[verify_string length]>0){
        if([[CPUIModelManagement sharedInstance] canConnectToNetwork]){
            [self do_show_loading_view_content_string:@"正在更改密码"];
            [[CPUIModelManagement sharedInstance] resetPasswordPostWithUserName:self.end_username_string  andMobileNumber:self.end_mobile_string   andPwd:password_string andVerifyCode:verify_string];
        }
        else{
            [self do_show_toptip_view_toptip_string:@"网络连接异常!"];
        }

    }

}
- (void)do_resend{
    [self do_hide_resend_button];
    [self do_active_count_down];
   // [[CPUIModelManagement sharedInstance] 
    
    if([[CPUIModelManagement sharedInstance] canConnectToNetwork]){
        [[CPUIModelManagement sharedInstance] resetPasswordGetCodeWithUserName:self.end_username_string andMobileNumber:self.end_mobile_string];
    }
    else{
        [self do_show_toptip_view_toptip_string:@"网络连接异常!"];
        return;
    }
}
- (void)do_cancel{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)do_show_resend_button{
    [self.view addSubview:self.resend_button];
}
- (void)do_hide_resend_button{
    [self.resend_button removeFromSuperview];
}
- (void)do_active_count_down{
    [self.view addSubview:self.count_down];
    [self.count_down StartCountDown];
    self.actived_count_down = YES;
}
- (void)do_unactive_count_down{
    [self.count_down StopCountDown];
    [self.count_down removeFromSuperview];
    self.actived_count_down = NO;
}
#pragma mark rise_drop
- (void)do_rise_main_view{
    [UIView animateWithDuration:FORGET_MAIN_VIEW_ANIMATION_DURATION animations:^{
        [self.view setFrame:CGRectMake(FORGET_MAIN_VIEW_X, FORGET_MAIN_VIEW_Y, FORGET_MAIN_VIEW_W, FORGET_MAIN_VIEW_H)];
        [self.view setFrame:CGRectMake(FORGET_MAIN_VIEW_X, FORGET_MAIN_VIEW_Y - FORGET_MAIN_VIEW_RISE_H, FORGET_MAIN_VIEW_W, FORGET_MAIN_VIEW_H)];
    } completion:^(BOOL finished){
        self.rised_main_view = YES;
    }];
}
- (void)do_drop_main_view{
    
    [UIView animateWithDuration:FORGET_MAIN_VIEW_ANIMATION_DURATION animations:^{
        [self.view setFrame:CGRectMake(FORGET_MAIN_VIEW_X, FORGET_MAIN_VIEW_Y - FORGET_MAIN_VIEW_RISE_H, FORGET_MAIN_VIEW_W, FORGET_MAIN_VIEW_H)];
        [self.view setFrame:CGRectMake(FORGET_MAIN_VIEW_X, FORGET_MAIN_VIEW_Y, FORGET_MAIN_VIEW_W, FORGET_MAIN_VIEW_H)];
    } completion:^(BOOL finished){
        self.rised_main_view = NO;
    }];
}
#pragma mark ShakeFieldDelegate
- (void)shake_field_did_begin_editing:(UITextField *)text_field{
    /*
    if(self.rised_main_view == NO){
        [self do_rise_main_view];
    }
     */
}
- (void)shake_field_did_end_editing:(UITextField *)text_field{
    /*
    if(self.rised_main_view == YES){
        [self do_drop_main_view];
    }
     */
}
- (void)shake_field_should_return:(UITextField *)text_field{
    if(self.rised_main_view == YES){
        [self do_drop_main_view];
    }
}
- (void)shake_field_did_text_edit:(UITextField *)text_field{
    
}
#pragma mark CountDownDelegate
-(void)endNotify{
    [self do_unactive_count_down];
    self.count_down.number = FORGET_TIMEOUT_INTERVAL;
    [self do_show_resend_button];
}
#pragma mark UIResponder 
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.password_field do_hide_keyboard];
    [self.verify_code_field do_hide_keyboard];
    if(self.rised_main_view == YES){
        [self do_drop_main_view];
    }
}
@end
