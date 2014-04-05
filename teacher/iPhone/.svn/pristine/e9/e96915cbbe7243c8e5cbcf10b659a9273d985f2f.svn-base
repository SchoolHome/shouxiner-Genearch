//
//  EventTableViewCell.h
//  iCouple
//
//  Created by yong wei on 12-3-28.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddContactCellBase.h"
#import "HPHeadView.h"

@interface EventTableViewCell : AddContactCellBase

@property (strong,nonatomic) UIButton *addButton;
@property (strong,nonatomic) UIFont *buttonTitleFont;
@property (strong,nonatomic) UILabel *descriptionSucceedLabel;
@property (strong,nonatomic) UIImageView *succeedImage;
@property (strong,nonatomic) UILabel *descriptionFailLabel;
@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;
@property (nonatomic) BOOL isShuangShuangRecommon; 
////  其他情况下，显示的错误消息，并且不允许在此点击按钮
//@property (strong,nonatomic) UILabel *descriptionOtherFaillabel;
@property (nonatomic,strong) HPHeadView *headView;

-(void) changeCellForLoading;
-(void) changeCellForSucceed;
-(void) changeCellForFail;
-(void) changeCellForSucceedNoText;
-(void) changeCellForSucceedForCloseFriend;

-(void) startTimer;
@end
