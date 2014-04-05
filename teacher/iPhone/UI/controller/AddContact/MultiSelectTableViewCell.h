//
//  MultiSelectTableViewCell.h
//  iCouple
//
//  Created by yong wei on 12-3-28.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddContactCellBase.h"

@interface MultiSelectTableViewCell : AddContactCellBase
@property (strong,nonatomic) UIButton *selectButton;

@property (nonatomic) BOOL isSelectedButton;
@property (strong,nonatomic) UILabel *descriptionSucceedLabel;
@property (nonatomic) BOOL isSendedMessage;

-(void) changeSucceed;
-(void) changeSelectButtonState;

@end
