//
//  ForgotPwdVC.m
//  teacher
//
//  Created by mac on 14/12/5.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "ForgotPwdVC.h"
#import "AppDelegate.h"
@interface ForgotPwdVC ()
{
    UITextField *phoneField;
    UITextField *verfyField;
    UIButton *codeBtn;
    UITextField *newPwdField;
    UITextField *confirmPwd;
    NSString *smsID;
    
    NSTimer *lastTimer;
}
@end

@implementation ForgotPwdVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[PalmUIManagement sharedInstance] addObserver:self forKeyPath:@"resetSMSCode" options:0 context:nil];
    [[PalmUIManagement sharedInstance] addObserver:self forKeyPath:@"resetPassword" options:0 context:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[PalmUIManagement sharedInstance] removeObserver:self forKeyPath:@"resetSMSCode"];
    [[PalmUIManagement sharedInstance] removeObserver:self forKeyPath:@"resetPassword"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat height = 44;
    if (IOS7) {
        height = 64;
    }
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, height)];
    [headerView setBackgroundColor:[UIColor whiteColor]];
    headerView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    headerView.layer.shadowRadius = 1.f;
    headerView.layer.shadowOpacity = 0.5f;
    [headerView.layer setShadowOffset:CGSizeMake(0, 1)];
    [self.view addSubview:headerView];
    
    height = 0;
    if(IOS7)
    {
        height = 20;
    }
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, height, headerView.frame.size.width, 44)];
    [title setFont:[UIFont systemFontOfSize:20]];
    [title setBackgroundColor:[UIColor whiteColor]];
    [title setText:@"重置密码"];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setTextColor:[UIColor colorWithHexString:@"ff9632"]];
    [headerView addSubview:title];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setFrame:CGRectMake(10.f, height + 11.f, 22.f, 22.f)];
    [back setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backViewController) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:back];
    
    
    height = 54;
    if (IOS7) {
        height = 74;
    }
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, height, self.view.frame.size.width, 44)];
    [subView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:subView];
    subView = nil;
    phoneField = [[UITextField alloc] initWithFrame:CGRectMake(10, height, self.view.frame.size.width-20, 44)];
    [phoneField setPlaceholder:@"输入正确的手机号码"];
    [phoneField setFont:[UIFont systemFontOfSize:16]];
    [phoneField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [phoneField setBackgroundColor:[UIColor whiteColor]];
    [phoneField setDelegate:(id<UITextFieldDelegate>)self];
    [phoneField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:phoneField];
    
    height = height + 45;
    subView = [[UIView alloc] initWithFrame:CGRectMake(0, height, self.view.frame.size.width, 44)];
    [subView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:subView];
    subView = nil;
    verfyField = [[UITextField alloc] initWithFrame:CGRectMake(10, height, self.view.frame.size.width-110, 44)];
    [verfyField setPlaceholder:@"输入验证码"];
    [verfyField setFont:[UIFont systemFontOfSize:16]];
    [verfyField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [verfyField setBackgroundColor:[UIColor whiteColor]];
    [verfyField setDelegate:(id<UITextFieldDelegate>)self];
    [verfyField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:verfyField];
    codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [codeBtn setFrame:CGRectMake(self.view.frame.size.width-100, height+5, 80, 30)];
    [codeBtn setImage:[UIImage imageNamed:@"GetSmsCode.png"] forState:UIControlStateNormal];
    [codeBtn.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
    [codeBtn addTarget:self action:@selector(getVerfyCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeBtn];
    
    height = height + 55;
    subView = [[UIView alloc] initWithFrame:CGRectMake(0, height, self.view.frame.size.width, 44)];
    [subView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:subView];
    subView = nil;
    newPwdField = [[UITextField alloc] initWithFrame:CGRectMake(10, height, self.view.frame.size.width-20, 44)];
    [newPwdField setPlaceholder:@"新密码(6位以上字母和数字组合)"];
    [newPwdField setFont:[UIFont systemFontOfSize:16]];
    [newPwdField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [newPwdField setBackgroundColor:[UIColor whiteColor]];
    [newPwdField setSecureTextEntry:YES];
    [newPwdField setDelegate:(id<UITextFieldDelegate>)self];
    [self.view addSubview:newPwdField];
    height = height + 45;
    subView = [[UIView alloc] initWithFrame:CGRectMake(0, height, self.view.frame.size.width, 44)];
    [subView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:subView];
    subView = nil;
    confirmPwd = [[UITextField alloc] initWithFrame:CGRectMake(10, height, self.view.frame.size.width-20, 44)];
    [confirmPwd setPlaceholder:@"确认新密码"];
    [confirmPwd setFont:[UIFont systemFontOfSize:16]];
    [confirmPwd setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [confirmPwd setBackgroundColor:[UIColor whiteColor]];
    [confirmPwd setSecureTextEntry:YES];
    [confirmPwd setDelegate:(id<UITextFieldDelegate>)self];
    [self.view addSubview:confirmPwd];
    height = height + 80;
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake((self.view.frame.size.width - 271.f)/2.0f, height, 271.f, 43.f);
    [loginBtn setImage:[UIImage imageNamed:@"reset.png"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBG:)];
    [self.view addGestureRecognizer:tap];
}

-(void)getVerfyCode:(UIButton *)btn
{
    NSString *telPhoneText = nil;
    if (nil != phoneField) {
        telPhoneText = [phoneField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    if (nil != phoneField) {
        if (nil == telPhoneText || [telPhoneText isEqualToString:@""]) {
            [self showProgressWithText:@"手机号不能为空" withDelayTime:1.0f];
            return;
        }
    }
    [codeBtn setBackgroundColor:[UIColor grayColor]];
    [codeBtn setImage:nil forState:UIControlStateNormal];
    [codeBtn setUserInteractionEnabled:NO];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.smsTime = 120;
    [codeBtn setTitle:[NSString stringWithFormat:@"%d秒后重试", delegate.smsTime] forState:UIControlStateNormal];
    lastTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(lastTime) userInfo:nil repeats:YES];
    [[PalmUIManagement sharedInstance] getResetPasswordSMS:telPhoneText];
}

-(void)lastTime
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.smsTime = delegate.smsTime - 1;
    if (delegate.smsTime == 0) {
        [lastTimer invalidate];
        lastTimer = nil;
        [codeBtn setImage:[UIImage imageNamed:@"GetSmsCode.png"] forState:UIControlStateNormal];
        [codeBtn setUserInteractionEnabled:YES];
    }else{
        [codeBtn setTitle:[NSString stringWithFormat:@"%d秒后重试", delegate.smsTime] forState:UIControlStateNormal];
    }
}

-(void)clickBG:(UIGestureRecognizer *)tap
{
    [phoneField resignFirstResponder];
    [verfyField resignFirstResponder];
    [newPwdField resignFirstResponder];
    [confirmPwd resignFirstResponder];
}

-(void)login:(UIButton *)btn
{
    [phoneField resignFirstResponder];
    [verfyField resignFirstResponder];
    [newPwdField resignFirstResponder];
    [confirmPwd resignFirstResponder];
    
    NSString *userName  = [phoneField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ( nil == userName || [userName isEqualToString:@""] ) {
        [self showProgressWithText:@"手机号不能为空" withDelayTime:1.5f];
        return;
    }
    
    NSString *verfyCode  = [verfyField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ( nil == verfyCode || [verfyCode isEqualToString:@""] ) {
        [self showProgressWithText:@"验证码不能为空" withDelayTime:1.5f];
        return;
    }
    
    if ([newPwdField.text isEqualToString:confirmPwd.text]) {
        NSString *password = [newPwdField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if (nil == password || [password isEqualToString:@""]) {
            [self showProgressWithText:@"请填写密码" withDelayTime:1.5f];
            return;
        }
        if (smsID != nil || smsID.length == 0) {
            [self showProgressWithText:@"正在重置，请稍候..."];
            [[PalmUIManagement sharedInstance] postResetPassword:smsID withSmsCode:verfyCode withNewPassword:password];
        }else{
            [self showProgressWithText:@"请获取验证码" withDelayTime:2.0f];
        }
        
    }else{
        [self showProgressWithText:@"两次密码输入不一致" withDelayTime:1.0f];
    }
}

-(void)backViewController
{
    [lastTimer invalidate];
    lastTimer = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"resetSMSCode"]){
        NSDictionary *resultDic = [[PalmUIManagement sharedInstance] resetSMSCode];
        if ([resultDic[ASI_REQUEST_HAS_ERROR] boolValue]) {
            [lastTimer invalidate];
            lastTimer = nil;
            [codeBtn setImage:[UIImage imageNamed:@"GetSmsCode.png"] forState:UIControlStateNormal];
            [codeBtn setUserInteractionEnabled:YES];
            [self showProgressWithText:resultDic[ASI_REQUEST_ERROR_MESSAGE] withDelayTime:1.0f];
            return;
        }else{
            smsID = resultDic[@"data"][@"id"];
        }
    }else if([keyPath isEqualToString:@"resetPassword"]){
        NSDictionary *resultDic = [[PalmUIManagement sharedInstance] resetPassword];
        if ([resultDic[@"data"][@"errno"] integerValue] == 0) {
            [self closeProgress];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [lastTimer invalidate];
            lastTimer = nil;
            [codeBtn setImage:[UIImage imageNamed:@"GetSmsCode.png"] forState:UIControlStateNormal];
            [codeBtn setUserInteractionEnabled:YES];
            [self showProgressWithText:resultDic[@"data"][@"error"] withDelayTime:2];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == phoneField) {
        [verfyField becomeFirstResponder];
    }else if(textField == verfyField){
        [newPwdField becomeFirstResponder];
    }else if(textField == newPwdField){
        [confirmPwd becomeFirstResponder];
    }else{
        [confirmPwd resignFirstResponder];
    }
    return YES;
}
@end
