//
//  SingleTableViewCell.m
//  iCouple
//
//  Created by yong wei on 12-3-30.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "SingleTableViewCell.h"

@implementation SingleTableViewCell
@synthesize dataType = _dataType ,selectedImage = _selectedImage , descriptionSucceedLabel = _descriptionSucceedLabel , isSendedMessage = _isSendedMessage;
@synthesize headView = _headView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectedImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"item_check_selected.png"]];
        self.selectedImage.frame = CGRectMake(252.0f, self.frame.size.height / 2.0f - 27.5f / 2 , 27.5, 27.5);
        self.selectedImage.hidden = YES;
        [self addSubview:self.selectedImage];
        
        self.descriptionSucceedLabel = [[UILabel alloc] initWithFrame:CGRectMake(187.0f, self.frame.origin.y, 76.0f, 40.0f)];
        self.descriptionSucceedLabel.textAlignment = UITextAlignmentLeft;
        self.descriptionSucceedLabel.font = self.nickNameFont;
        self.descriptionSucceedLabel.hidden = YES;
        self.descriptionSucceedLabel.text = @"邀请已发出";
        self.descriptionSucceedLabel.textColor = [UIColor grayColor];
        [self.descriptionSucceedLabel sizeToFit];
        self.descriptionSucceedLabel.frame = CGRectMake(187.0f, self.frame.origin.y + 2.0f, 
                                                        self.descriptionSucceedLabel.frame.size.width, 
                                                        40.0f);
        [self addSubview:self.descriptionSucceedLabel];
    }
    
    return self;
}

-(void) changeSucceed{
    self.selectedImage.hidden = NO;
    self.descriptionSucceedLabel.hidden = NO;
    self.isSendedMessage = YES;
}


@end
