//
//  SingleTableViewCell.h
//  iCouple
//
//  Created by yong wei on 12-3-30.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddContactCellBase.h"
#import "HPHeadView.h"

@interface SingleTableViewCell : AddContactCellBase

// 0 - 好友数据
// 1 - 密友数据
@property (nonatomic) NSUInteger dataType;

@property (strong,nonatomic) UIImageView *selectedImage;
@property (strong,nonatomic) UILabel *descriptionSucceedLabel;
@property (nonatomic) BOOL isSendedMessage;

@property (nonatomic,strong) HPHeadView *headView;

-(void) changeSucceed;

@end
