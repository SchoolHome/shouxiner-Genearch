//
//  MultiSelectTableViewCell.m
//  iCouple
//
//  Created by yong wei on 12-3-28.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "MultiSelectTableViewCell.h"

@implementation MultiSelectTableViewCell
@synthesize selectButton = _selectButton , isSelectedButton = _isSelectedButton , descriptionSucceedLabel = _descriptionSucceedLabel , isSendedMessage = _isSendedMessage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.isSelectedButton = NO;
        self.selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.selectButton.frame = CGRectMake(268.0f, self.frame.size.height / 2.0f - 27.5f / 2 , 27.5, 27.5);
        [self addSubview:self.selectButton];
        
        self.descriptionSucceedLabel = [[UILabel alloc] initWithFrame:CGRectMake(187.0f, self.frame.origin.y + 2.0f, 76.0f, 40.0f)];
        self.descriptionSucceedLabel.textAlignment = UITextAlignmentLeft;
        self.descriptionSucceedLabel.font = self.nickNameFont;
        self.descriptionSucceedLabel.hidden = YES;
        self.descriptionSucceedLabel.text = @"邀请已上路";//邀请已发出
        self.descriptionSucceedLabel.textColor = [UIColor grayColor];
        [self.descriptionSucceedLabel sizeToFit];
        self.descriptionSucceedLabel.frame = CGRectMake(199.0f, self.frame.origin.y + 2.0f, 
                                                        self.descriptionSucceedLabel.frame.size.width, 
                                                        40.0f);
        [self addSubview:self.descriptionSucceedLabel];
    }
    return self;
}

-(void) changeSucceed{
    self.descriptionSucceedLabel.hidden = NO;
    self.isSendedMessage = YES;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
}

-(void) setIsSelectedButton:(BOOL)isSelectedButton{
    _isSelectedButton = isSelectedButton;
    if (self.isSelectedButton) {
        [self.selectButton setBackgroundImage:[UIImage imageNamed:@"item_check_selected.png"] forState:UIControlStateNormal];
        [self.selectButton setBackgroundImage:[UIImage imageNamed:@"item_check_selected.png"] forState:UIControlStateHighlighted];
    }else {
        [self.selectButton setBackgroundImage:[UIImage imageNamed:@"item_check_unselected.png"] forState:UIControlStateNormal];
        [self.selectButton setBackgroundImage:[UIImage imageNamed:@"item_check_unselected.png"] forState:UIControlStateHighlighted];
    }
}

-(void) changeSelectButtonState{
    self.isSelectedButton = !self.isSelectedButton;
    /*
    if (self.isSelectedButton) {
        [self.selectButton setBackgroundImage:[UIImage imageNamed:@"item_check_selected.png"] forState:UIControlStateNormal];
        [self.selectButton setBackgroundImage:[UIImage imageNamed:@"item_check_selected.png"] forState:UIControlStateHighlighted];
    }else {
        [self.selectButton setBackgroundImage:[UIImage imageNamed:@"item_check_unselected.png"] forState:UIControlStateNormal];
        [self.selectButton setBackgroundImage:[UIImage imageNamed:@"item_check_unselected.png"] forState:UIControlStateHighlighted];
    }
     */
}



@end
