//
//  FXShakeField.h
//  iCouple
//
//  Created by lixiaosong on 12-3-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@protocol FXShakeFieldDelegate <NSObject>
@optional
- (void)shake_field_did_begin_editing:(UITextField *)text_field;
- (void)shake_field_did_end_editing:(UITextField *)text_field;
- (void)shake_field_should_return:(UITextField *)text_field;
- (void)shake_field_did_text_edit:(UITextField *)text_field;

@end
@class FXInputAlert;
@interface FXShakeField : UIView <UITextFieldDelegate>
@property (nonatomic, retain) UIImageView * shake_icon_view;
@property (nonatomic, retain) UIImageView * shake_image_view;
@property (nonatomic, retain) UITextField * shake_text_field;
@property (nonatomic, retain) UIImageView * shake_alert_view;
@property (nonatomic, retain) FXInputAlert * shake_input_alert;
@property (nonatomic, strong) UILabel * tip;
@property (strong,nonatomic) id<FXShakeFieldDelegate> delegate;
@property (strong,nonatomic) NSString *text;
@property (assign,nonatomic) NSInteger edit_limit_int;
@property (assign,nonatomic) NSInteger last_limit_int;
@property (strong,nonatomic) UIImage * end_editing_did_begin_image;
@property (strong,nonatomic) UIImage * end_editing_did_end_image;
@property (assign,nonatomic) BOOL rised_alert;
@property (assign,nonatomic) BOOL rised_tip;
@property (assign,nonatomic) BOOL rised_input_alert;
/*
 
 */
- (id)initWithFrame:(CGRect)frame ground_image:(UIImage *)ground_image;
- (id)initWithFrame:(CGRect)frame ground_image:(UIImage *)ground_image icon_image:(UIImage *)icon_image;
- (id)initWithFrame:(CGRect)frame ground_image:(UIImage *)ground_image icon_imageview:(UIImageView *)icon_image;
- (void)do_init_action;
- (void)do_init_config;
/*
 
 */
- (void)do_set_placeholder_string:(NSString *)string;
- (void)do_set_text_font:(UIFont *)text_font;
- (void)do_set_text_color:(UIColor *)text_color;
- (void)do_set_text_alignment:(UITextAlignment)text_alignment;
- (void)do_set_text_secured:(BOOL)secured;
- (void)do_set_text_clear_button_mode:(UITextFieldViewMode *)text_clear_button_mode;
- (void)do_set_keyboard_appearance:(UIKeyboardAppearance)keyboard_appearance;
- (void)do_set_keyboard_type:(UIKeyboardType)keyboard_type;
- (void)do_set_return_type:(UIReturnKeyType)return_type;
- (void)do_set_background_editing_did_begin_image:(UIImage *)editing_did_begin_image editing_did_end_image:(UIImage *)editing_did_end_image;

/*
 
 */
- (void)do_shake;
/*
 
 */
- (void)do_init_alert;
- (void)do_show_alert;
- (void)do_hide_alert;
- (void)do_init_input_alert;
- (void)do_show_input_alert_string:(NSString *)alert_string;
- (void)do_hide_input_alert;
- (void)do_init_tip;
- (void)do_show_tip_info_string:(NSString *)info_string;
- (void)do_hide_tip;
/*
 
 */
- (void)do_lock_editing;
- (void)do_unlock_editing;
- (void)do_hide_keyboard;
- (void)do_show_keyboard;
- (void)do_clear_text;
/*
 
 */
- (void)do_respond_editing_changed;
- (void)do_respond_editing_did_begin;
- (void)do_respond_editing_did_end;
- (void)do_respond_editing_did_end_on_exit;


- (void)RecoverText;
-(void)setKeyBoardReturnType:(NSInteger)keyboardtype;
-(BOOL)ShelfConfirm;

@end
