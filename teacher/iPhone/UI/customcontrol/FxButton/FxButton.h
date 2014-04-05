//
//  FxMoreNextButton.h
//  SweetAlarm
//
//  Created by 振杰 李 on 12-2-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FanxerHeader.h"
#import "ColorUtil.h"
#import <QuartzCore/QuartzCore.h>
@interface FxButton : UIButton {
    
    UILabel *textlabel;
    
    UIImageView *arrowimg;
    
    NSInteger optag;
    
    NSArray *controlarray;
}

@property (nonatomic,retain) UILabel *textlabel;

@property (nonatomic,retain) UIImageView *arrowimg;

@property (nonatomic,assign) NSInteger optag;

@property (nonatomic,retain) NSArray *controlarray;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title operationTag:(NSInteger)optag;

- (id)initWithFrame:(CGRect)frame operationTag:(NSInteger)optag;

- (id)initWithFrame:(CGRect)frame backGroundImg:(UIImage *)bg operationTag:(NSInteger)optag; 

- (id)initWithFrame:(CGRect)frame title:(NSString *)title img:(UIImage *)img operationTag:(NSInteger)operationtag;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title withcolor:(UIColor *)color img:(UIImage *)img ismulti:(BOOL)ismulti operationTag:(NSInteger)operationtag;

- (id)initWithFrame:(CGRect)frame backGroundImgNormal:(UIImage *)bg backGroundImgHight:(UIImage*)bgh
       ControlArray:(NSMutableArray *)controlarray 
       operationTag:(NSInteger)optag;

-(CGSize) calcLabelSize:(NSString *)string withFont:(UIFont *)font  maxSize:(CGSize)maxSize;


-(void)setContentView:(UIView *)contentview;


-(void)LoadColor:(NSString *)hexcolor withTag:(NSInteger)tag;

-(void)ResetText:(NSString *)text withTage:(NSInteger)tag;

- (void)do_shake;
@end
