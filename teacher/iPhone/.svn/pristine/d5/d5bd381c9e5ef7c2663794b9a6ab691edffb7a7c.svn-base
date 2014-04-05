//
//  SingleSystemUnknowCell.m
//  iCouple
//
//  Created by ming bright on 12-7-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SingleSystemUnknowCell.h"

@implementation SingleSystemUnknowCell



-(void)actionButtonTaped:(id)sender{
    if ([self.delegate respondsToSelector:@selector(systemTextActionCellTaped:)]) {
        [self.delegate systemTextActionCellTaped:self];
    }
}

-(void)backgroundTaped:(id)sender{
    if ([self.delegate respondsToSelector:@selector(systemTextActionCellTaped:)]) {
        [self.delegate systemTextActionCellTaped:self];
    }
}

- (id)initWithType : (MessageCellType) messageCellType  withBelongMe : (BOOL) isBelongMe withKey:(NSString *)key{
    self = [super initWithType:messageCellType withBelongMe:isBelongMe withKey:key];
    if (self) {
        
        textDisplayLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 80, 220, 35)];
        textDisplayLabel.backgroundColor = [UIColor clearColor];
        textDisplayLabel.font = [UIFont systemFontOfSize:11];
        textDisplayLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        textDisplayLabel.numberOfLines = 0;
        
        actionButton = [[UIButton alloc] initWithFrame: CGRectMake(130, 35, 55, 40)];
        //actionButton.frame = CGRectZero;
        [actionButton addTarget:self action:@selector(actionButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
        actionButton.exclusiveTouch = YES;
        
        ellipticalBackground.exclusiveTouch = YES;
        [ellipticalBackground addTarget:self action:@selector(backgroundTaped:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}


-(void)adaptEllipticalBackgroundImage{
    UIImage *ellipticalImage = nil;
    ellipticalImage = [UIImage imageNamed:@"bg_im_system_gray.png"];
    ellipticalImage = [ellipticalImage stretchableImageWithLeftCapWidth:15 topCapHeight:9];
    //ellipticalBackground.image = ellipticalImage;
    
    [ellipticalBackground setBackgroundImage:ellipticalImage forState:UIControlStateNormal];
    [ellipticalBackground setBackgroundImage:ellipticalImage forState:UIControlStateHighlighted];
    
}

- (void)refreshCell{
    [super refreshCell];
    
    ExMessageModel *model = (ExMessageModel *)self.data;
    
    [self addSubview:textDisplayLabel];
    [self addSubview:actionButton];
    
    textDisplayLabel.frame = CGRectMake(130, 80, 173, 35);  //173
    
    textDisplayLabel.text = [NSString stringWithFormat:@"%@",model.messageModel.msgText];//@"系统消息 周末哪里去玩啊？      去看看";
    [textDisplayLabel sizeToFit];
    textDisplayLabel.frame = CGRectMake((320 - textDisplayLabel.frame.size.width-actionButton.frame.size.width-11+kLeftAndRightPadding)/2, kCellTopPadding+4, textDisplayLabel.frame.size.width,textDisplayLabel.frame.size.height);
    
    
    actionButton.titleLabel.font = [UIFont systemFontOfSize:11];
    [actionButton setTitle:@"升级吧！" forState:UIControlStateNormal];
    
    UIImage *image = [[UIImage imageNamed:@"item_system_upgrade"] stretchableImageWithLeftCapWidth:0 topCapHeight:9];
    
    UIImage *image1 = [[UIImage imageNamed:@"item_system_upgradepress"] stretchableImageWithLeftCapWidth:0 topCapHeight:9];
    [actionButton setBackgroundImage:image forState:UIControlStateNormal];
    [actionButton setBackgroundImage:image1 forState:UIControlStateHighlighted];
    actionButton.frame = CGRectMake(textDisplayLabel.frame.origin.x + textDisplayLabel.frame.size.width+11, kCellTopPadding, 55, textDisplayLabel.frame.size.height+8);
    
    
    [self adaptEllipticalBackgroundImage];
    
    self.ellipticalBackground.frame = CGRectMake(textDisplayLabel.frame.origin.x - kLeftAndRightPadding, kCellTopPadding, textDisplayLabel.frame.size.width+2*kLeftAndRightPadding+11, textDisplayLabel.frame.size.height+8);
    //self.ellipticalBackground.frame = CGRectMake((320 - textDisplayLabel.frame.size.width - 20)/2, kCellTopPadding, textDisplayLabel.frame.size.width+20, 18);
    
    //actionButton.frame = CGRectMake(ellipticalBackground.frame.origin.x + ellipticalBackground.frame.size.width - 48.5, kCellTopPadding, 48.5, 18);//18
    
    
    timestampLabel.frame = CGRectMake((320 -50)/2, ellipticalBackground.frame.size.height+kCellTopPadding+2, 50, kTimestampLabelHeight);
    timestampLabel.text = [self timeStringFromNumber:model.messageModel.date];
    
    resendButton.hidden = YES;
}


@end
