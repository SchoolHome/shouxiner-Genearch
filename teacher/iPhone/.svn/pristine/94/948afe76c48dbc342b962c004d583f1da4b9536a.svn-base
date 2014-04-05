//
//  FanxerNavigationBar.h
//  SweetAlarm
//
//  Created by 振杰 李 on 11-12-7.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FanxerHeader.h"
#import "StyleProtocol.h"


@protocol FanxerNavigationBarDelegate;
@interface FanxerNavigationBarControl : UIView{
//    UIImageView * backageview;
//    UIButton *rightbutton;
//    UIButton *leftbutton;
//    id<FanxerNavigationBarDelegate> _delegate;
//    UILabel *centertitle;
//    NSObject<StyleProtocol> *styleobj;
}

@property (strong,nonatomic) UIImageView *backageview;
@property (strong, nonatomic) UIImage * backImage;
@property (strong,nonatomic) UIButton *rightbutton;
@property (strong,nonatomic) UIButton *leftbutton;
@property (assign,nonatomic) id<FanxerNavigationBarDelegate> _delegate;
@property (strong,nonatomic) UILabel *centertitle;
@property (strong,nonatomic) NSObject<StyleProtocol> *styleobj;

- (id)initWithFrame:(CGRect)frame withStyle:(NSObject<StyleProtocol> *)style withDefinedUserControl:(BOOL)yesornot;

-(void)ResetTitle:(NSString *)title;

-(void)ResetRightControl:(UIView *)buttonview;

-(void)ResetLeftControl:(UIView *)buttonview;


-(void)doLeft;

-(void)doRight;

-(void)doExtraLeft;

-(void)doExtraRight;


-(void)RecoverRightViewWithTag:(NSInteger)tag;

-(void)RecoverLeftViewWithTag:(NSInteger)tag;

@end
@protocol FanxerNavigationBarDelegate <NSObject>

@optional

-(void)doLeft;

-(void)doRight;

-(void)doExtraRight;

-(void)doExtraLeft;

@end