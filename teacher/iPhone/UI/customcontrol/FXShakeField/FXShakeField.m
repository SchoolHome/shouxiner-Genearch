//
//  FXShakeField.m
//  iCouple
//
//  Created by lixiaosong on 12-3-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#define FX_SHAKE_DURATION 0.05
#define FX_SHAKE_REPEATE 3
#define FX_SHAKE_LENGTH 20.0f

#define FX_SHAKE_ALERT_WIDTH 30
#define FX_SHAKE_ALERT_HEIGHT 30


#import "ColorUtil.h"
#import "FanxerHeader.h"
#import "FXShakeField.h"
#import "FXInputAlert.h"
@implementation FXShakeField
@synthesize shake_icon_view = _shake_icon_view;
@synthesize shake_image_view = _shake_image_view;
@synthesize shake_text_field = _shake_text_field;
@synthesize shake_alert_view = _shake_alert_view;
@synthesize shake_input_alert = _shake_input_alert;
@synthesize tip = _tip;
@synthesize delegate = _delegate;
@synthesize text = _text;
@synthesize edit_limit_int = _edit_limit_int;
@synthesize last_limit_int = _last_limit_int;
@synthesize end_editing_did_begin_image = _end_editing_did_begin_image;
@synthesize end_editing_did_end_image = _end_editing_did_end_image;
@synthesize rised_alert = _rised_alert;
@synthesize rised_tip = _rised_tip;
@synthesize rised_input_alert = _rised_input_alert;
#pragma mark Init
- (id)initWithFrame:(CGRect)frame ground_image:(UIImage *)ground_image{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView * shake_image_view_temp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [shake_image_view_temp setUserInteractionEnabled:YES];
        [shake_image_view_temp setImage:ground_image];
        self.shake_image_view = shake_image_view_temp;
        shake_image_view_temp = nil;
        
        UITextField * shake_text_field_temp = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.height-35,15.0, frame.size.width-frame.size.height+25, frame.size.height-10)];
        [shake_text_field_temp setDelegate:self];
        [shake_text_field_temp setFont: [UIFont boldSystemFontOfSize:15]];
        shake_text_field_temp.textColor=[UIColor colorWithHexString:@"#B6B6B6"];
        [shake_text_field_temp setAutocorrectionType:UITextAutocorrectionTypeNo];
        self.shake_text_field = shake_text_field_temp;
        
        [self do_init_config];
        [self do_init_action];
        [self addSubview:self.shake_image_view];
        [self addSubview:self.shake_text_field];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame ground_image:(UIImage *)ground_image icon_image:(UIImage *)icon_image{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView * shake_image_view_temp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [shake_image_view_temp setUserInteractionEnabled:YES];
        [shake_image_view_temp setImage:ground_image];
        self.shake_image_view = shake_image_view_temp;
        shake_image_view_temp = nil;
        
        UIImageView * shake_icon_view_temp = [[UIImageView alloc] initWithFrame:CGRectMake(8, 6,  50.0/2.0, 50.0/2.0)];
        [shake_icon_view_temp setUserInteractionEnabled:YES];
        [shake_icon_view_temp setImage:icon_image];
        self.shake_icon_view = shake_icon_view_temp;
        shake_icon_view_temp = nil;
        
        UITextField * shake_text_field_temp = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.height+3,8.0, frame.size.width-frame.size.height-7, frame.size.height-10)];
        [shake_text_field_temp setDelegate:self];
        [shake_text_field_temp setFont: [UIFont systemFontOfSize:14]];
        shake_text_field_temp.textColor=[UIColor colorWithHexString:@"#B6B6B6"];
        [shake_text_field_temp setAutocorrectionType:UITextAutocorrectionTypeNo];
        self.shake_text_field = shake_text_field_temp;
        shake_text_field_temp = nil;
        
        [self do_init_config];
        [self do_init_action];
        [self addSubview:self.shake_image_view];
        [self addSubview:self.shake_icon_view];
        [self addSubview:self.shake_text_field];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame ground_image:(UIImage *)ground_image icon_imageview:(UIImageView *)icon_image{
    
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView * shake_image_view_temp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [shake_image_view_temp setUserInteractionEnabled:YES];
        [shake_image_view_temp setImage:ground_image];
        self.shake_image_view = shake_image_view_temp;
        shake_image_view_temp = nil;
        // [[UIImageView alloc] initWithFrame:CGRectMake(8, 4,  50.0/2.0, 50.0/2.0)];
        UIImageView * shake_icon_view_temp =icon_image;
        
        [shake_icon_view_temp setUserInteractionEnabled:YES];
        //        [shake_icon_view_temp setImage:icon_image];
        self.shake_icon_view = shake_icon_view_temp;
        shake_icon_view_temp = nil;
        
        UITextField * shake_text_field_temp = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.height+3,12.0, frame.size.width-frame.size.height-7, frame.size.height-10)];
        [shake_text_field_temp setDelegate:self];
        [shake_text_field_temp setFont: [UIFont boldSystemFontOfSize:14]];
        shake_text_field_temp.textColor=[UIColor colorWithHexString:@"#B6B6B6"];
        [shake_text_field_temp setAutocorrectionType:UITextAutocorrectionTypeNo];
        self.shake_text_field = shake_text_field_temp;
        shake_text_field_temp = nil;
        
        [self do_init_config];
        [self do_init_action];
        [self addSubview:self.shake_image_view];
        [self addSubview:self.shake_icon_view];
        [self addSubview:self.shake_text_field];
    }
    return self;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
#pragma mark Set

- (void)do_set_placeholder_string:(NSString *)string{
    [self.shake_text_field setPlaceholder:string];
}
- (void)do_set_text_font:(UIFont *)text_font{
    [self.shake_text_field setFont:text_font];
}
- (void)do_set_text_color:(UIColor *)text_color{
    [self.shake_text_field setTextColor:text_color];
}
- (void)do_set_text_alignment:(UITextAlignment)text_alignment{
    [self.shake_text_field setTextAlignment:text_alignment];
}
- (void)do_set_text_secured:(BOOL)secured{
    [self.shake_text_field setSecureTextEntry:secured];
}
- (void)do_set_text_clear_button_mode:(UITextFieldViewMode *)text_clear_button_mode{
    [self.shake_text_field setClearButtonMode:UITextFieldViewModeUnlessEditing];
}
- (void)do_set_keyboard_appearance:(UIKeyboardAppearance)keyboard_appearance{
    [self.shake_text_field setKeyboardAppearance:keyboard_appearance];
}
- (void)do_set_keyboard_type:(UIKeyboardType)keyboard_type{
    [self.shake_text_field setKeyboardType:keyboard_type];
}
- (void)do_set_return_type:(UIReturnKeyType)return_type{
    [self.shake_text_field setReturnKeyType:return_type];
}
- (void)do_set_background_editing_did_begin_image:(UIImage *)editing_did_begin_image editing_did_end_image:(UIImage *)editing_did_end_image{
    self.end_editing_did_begin_image = editing_did_begin_image;
    self.end_editing_did_end_image = editing_did_end_image;
}
- (void)do_init_config{
    self.edit_limit_int = 50;
    self.last_limit_int = 10;
    self.rised_alert = NO;
    self.rised_tip = NO;
    self.rised_input_alert = NO;
}
#pragma mark Action
- (void)do_init_action{
    [self.shake_text_field addTarget:self action:@selector(do_respond_editing_changed) forControlEvents:UIControlEventEditingChanged];
    [self.shake_text_field addTarget:self action:@selector(do_respond_editing_did_begin) forControlEvents:UIControlEventEditingDidBegin];
    [self.shake_text_field addTarget:self action:@selector(do_respond_editing_did_end) forControlEvents:UIControlEventEditingDidEnd];
    [self.shake_text_field addTarget:self action:@selector(do_respond_editing_did_end_on_exit) forControlEvents:UIControlEventEditingDidEndOnExit];
}
- (void)do_shake{
    CABasicAnimation *animation = 
    [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setDuration:FX_SHAKE_DURATION];
    [animation setRepeatCount:FX_SHAKE_REPEATE];
    [animation setAutoreverses:YES];
    [animation setFromValue:[NSValue valueWithCGPoint:
                             CGPointMake([self center].x - FX_SHAKE_LENGTH, [self center].y)]];
    [animation setToValue:[NSValue valueWithCGPoint:
                           CGPointMake([self center].x + FX_SHAKE_LENGTH, [self center].y)]];
    [[self layer] addAnimation:animation forKey:@"position"];
}
#pragma mark alert
- (void)do_init_alert{
    UIImageView * shake_alert_view_temp = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-13,-8, 17, 17)];
    [shake_alert_view_temp setImage:[UIImage imageNamed:FX_SHAKE_FIELD_ALERT]];
    self.shake_alert_view = shake_alert_view_temp;
    shake_alert_view_temp = nil;
}
- (void)do_show_alert{
    if(self.shake_alert_view == nil){
        [self do_init_alert];
    }
    [self addSubview:self.shake_alert_view];
    self.rised_alert = YES;
}
- (void)do_hide_alert{
    if(self.rised_alert == YES){
        [self.shake_alert_view removeFromSuperview];
        self.rised_alert = NO;
    }
}
#pragma mark input_alert
- (void)do_init_input_alert{
    FXInputAlert * shake_input_alert_temp = [[FXInputAlert alloc] initWithFrame:CGRectMake(self.frame.size.width-17, -17, 100, 17)];
    self.shake_input_alert = shake_input_alert_temp;
    shake_input_alert_temp = nil;
}
- (void)do_show_input_alert_string:(NSString *)alert_string{
    if(self.shake_input_alert == nil){
        [self do_init_input_alert];
    }
    [self.shake_input_alert do_set_alert_info_string:alert_string];
    [self addSubview:self.shake_input_alert];
    self.rised_input_alert = YES;
}
- (void)do_hide_input_alert{
    if(self.rised_input_alert == YES){
        [self.shake_input_alert removeFromSuperview];
        self.rised_input_alert = NO;
    }
}
#pragma mark Tip
- (void)do_init_tip{
    CGRect frame = self.frame;
    UILabel * tip_temp = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height, frame.size.width, 20)];
    [tip_temp setBackgroundColor:[UIColor clearColor]];
    [tip_temp setTextAlignment:UITextAlignmentCenter];
    [tip_temp setTextColor:[UIColor colorWithHexString:@"FD6B05"]];
    [tip_temp setFont:[UIFont boldSystemFontOfSize:11]];
    self.tip = tip_temp;
    tip_temp = nil;
}
- (void)do_show_tip_info_string:(NSString *)info_string{
    if(self.tip == nil){
        [self do_init_tip];
    }
    [self.tip setText:info_string];
    [self addSubview:self.tip];
    self.rised_tip = YES;
}
- (void)do_hide_tip{
    if(self.rised_tip == YES){
        [self.tip removeFromSuperview];
        self.rised_tip = NO;
    }
}
#pragma mark Lock
- (void)do_lock_editing{
    [self.shake_text_field setEnabled:NO];
}
- (void)do_unlock_editing{
    [self.shake_text_field setEnabled:YES];
}
- (void)do_hide_keyboard{
    [self.shake_text_field resignFirstResponder];
}
- (void)do_show_keyboard{
    [self.shake_text_field becomeFirstResponder];
}
- (void)do_clear_text{
    self.shake_text_field.text = @"";
    self.text = @"";
}
#pragma mark UITextField Action
/*
 正在编辑时候限定字符50个
 */
- (void)do_respond_editing_changed{
    self.text = self.shake_text_field.text;
    if([self.text length]>self.edit_limit_int){
        NSString * end_text_string = [self.text substringToIndex:self.edit_limit_int];
        self.shake_text_field.text = end_text_string;
        self.text = end_text_string;
    }
    // NSLog(@"edit text:%@\r\nlength:%d",self.shake_text_field.text,[self.text length]);
}
- (void)do_respond_editing_did_begin{
    if(self.end_editing_did_begin_image != nil){
        [self.shake_image_view setImage:self.end_editing_did_begin_image];
       }
}
/*
 结束编辑时候限定字符10个
 */
- (void)do_respond_editing_did_end{
    self.text = self.shake_text_field.text;
    if([self.text length]>self.last_limit_int){
        NSString * end_text_string = [self.text substringToIndex:self.last_limit_int];
        self.shake_text_field.text = end_text_string;
        self.text = end_text_string;
    }
   // NSLog(@"end text:%@\r\nlength:%d",self.shake_text_field.text,[self.text length]);
    
    if(self.end_editing_did_end_image != nil){
        [self.shake_image_view setImage:self.end_editing_did_end_image];
    }
}
- (void)do_respond_editing_did_end_on_exit{
    
}
#pragma mark UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (self.delegate!=nil) {
        [self.delegate shake_field_did_begin_editing:textField];
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.delegate!=nil) {
        [self.delegate shake_field_did_end_editing:textField];
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(self.delegate != nil){
        [self.delegate shake_field_did_text_edit:textField];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    BOOL result_status;
    [self.delegate shake_field_should_return:textField];
    if(textField.returnKeyType == UIReturnKeyNext){
        result_status = NO;
    }
    else if(textField.returnKeyType == UIReturnKeyDone){
        result_status = YES;
    }
    return result_status;
}

-(void)RecoverText{
    
    if ([self.shake_text_field.text length]<=0) {
        self.shake_text_field.text=self.text;
    }
}

-(void)setKeyBoardReturnType:(NSInteger)keyboardtype{
    
    self.shake_text_field.returnKeyType=keyboardtype;
    
}
-(BOOL)ShelfConfirm{
    
    if (self.shake_text_field.text==self.text) {
        return YES;
    }
    return NO;
}
@end
