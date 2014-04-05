//
//  BBGroupMessageGroupCell.m
//  teacher
//
//  Created by ZhangQing on 14-3-16.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBGroupMessageGroupCell.h"

@implementation BBGroupMessageGroupCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setMsgGroup:(CPUIModelMessageGroup *)msgGroup
{
    [super setMsgGroup:msgGroup];
    
    if (msgGroup) {
        if (msgGroup.memberList.count > 0) {
            //群聊
            self.userNameLabel.text = @"群聊";
        }
    }
    
    self.userHeadImageView.image = [UIImage imageNamed:@"girl.png"];
    [self.userHeadImageView.layer setMasksToBounds:YES];
    self.userHeadImageView.layer.borderWidth = 0;
    self.userHeadImageView.layer.cornerRadius = 25.0;
    self.userHeadImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    
}
@end
