//
//  BBMeTableViewCell.m
//  teacher
//
//  Created by mac on 14-3-14.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBMeTableViewCell.h"

@implementation BBMeTableViewCell
@synthesize headerImageView;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.clipsToBounds = YES;
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        headerImageView = [[EGOImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:headerImageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected) {
        [self setBackgroundColor:[UIColor colorWithRed:0.204f green:0.576f blue:0.871 alpha:1.0f]];
        [self.textLabel setTextColor:[UIColor whiteColor]];
    }else{
        [self setBackgroundColor:[UIColor colorWithRed:0.961f green:0.941f blue:0.921f alpha:1.0f]];
        [self.textLabel setTextColor:[UIColor blackColor]];
    }
    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.headerImageView.image || self.headerImageView.imageURL) {
        self.headerImageView.frame = CGRectMake(5, 10, 70, 70);
        self.headerImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.textLabel.frame = CGRectMake(100, self.contentView.frame.size.height/2-10, self.contentView.frame.size.width-120, 20);
    }else{
        self.headerImageView.frame = CGRectZero;
        self.textLabel.frame = CGRectMake(10, self.contentView.frame.size.height/2-10, self.contentView.frame.size.width-20, 20);
    }
}
@end
