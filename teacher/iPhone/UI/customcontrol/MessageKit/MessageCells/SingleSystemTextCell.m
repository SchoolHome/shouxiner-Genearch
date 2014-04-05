//
//  SingleSystemTextCell.m
//  iCouple
//
//  Created by ming bright on 12-5-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SingleSystemTextCell.h"

@implementation SingleSystemTextCell


- (id)initWithType : (MessageCellType) messageCellType  withBelongMe : (BOOL) isBelongMe withKey:(NSString *)key{
    self = [super initWithType:messageCellType withBelongMe:isBelongMe withKey:key];
    if (self) {
        
        textDisplayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 35)];
        textDisplayLabel.backgroundColor = [UIColor clearColor];
        textDisplayLabel.textAlignment = UITextAlignmentCenter;
        textDisplayLabel.font = [UIFont systemFontOfSize:11];
        textDisplayLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        textDisplayLabel.numberOfLines = 0;
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
    
    textDisplayLabel.frame = CGRectMake(130, 80, 235-2*kLeftAndRightPadding, 35);  
    [self addSubview:textDisplayLabel];
    textDisplayLabel.text = model.messageModel.msgText;//@"系统提示：您已经中奖！！";
    [textDisplayLabel sizeToFit];
    textDisplayLabel.frame = CGRectMake((320 - textDisplayLabel.frame.size.width)/2, kCellTopPadding+4, textDisplayLabel.frame.size.width,textDisplayLabel.frame.size.height);
    
    [self adaptEllipticalBackgroundImage];
    
    self.ellipticalBackground.frame = CGRectMake((320 - textDisplayLabel.frame.size.width - 2*kLeftAndRightPadding)/2, kCellTopPadding, textDisplayLabel.frame.size.width+2*kLeftAndRightPadding, textDisplayLabel.frame.size.height+8);
    
    timestampLabel.frame = CGRectMake((320 -50)/2, ellipticalBackground.frame.size.height+kCellTopPadding+2, 50, kTimestampLabelHeight);
    timestampLabel.text = [self timeStringFromNumber:model.messageModel.date];
    
    resendButton.hidden = YES;
}

@end
