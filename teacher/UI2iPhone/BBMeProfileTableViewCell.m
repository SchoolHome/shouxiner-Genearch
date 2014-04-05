//
//  BBMeProfileTableViewCell.m
//  teacher
//
//  Created by mac on 14-3-14.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBMeProfileTableViewCell.h"

@implementation BBMeProfileTableViewCell
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

-(void)layoutSubviews
{
    [super layoutSubviews];
    if (self.headerImageView.image || self.headerImageView.imageURL) {
        self.headerImageView.frame = CGRectMake(190, 10, 70, 70);
        self.headerImageView.contentMode = UIViewContentModeScaleAspectFit;
    }else{
        self.headerImageView.frame = CGRectZero;
    }
    
    CGRect textLabelFrame = self.textLabel.frame;
    textLabelFrame.origin.x = 10;
    textLabelFrame.origin.y = (self.contentView.frame.size.height - textLabelFrame.size.height)/2;
    self.textLabel.frame = textLabelFrame;
    CGRect detailLabelFrame ;
    detailLabelFrame.origin.x = textLabelFrame.origin.x+textLabelFrame.size.width+5;
    detailLabelFrame.origin.y = textLabelFrame.origin.y;
    detailLabelFrame.size.width = self.contentView.frame.size.width - textLabelFrame.origin.x - textLabelFrame.size.width - 30;
    detailLabelFrame.size.height = textLabelFrame.size.height;
    self.detailTextLabel.frame = detailLabelFrame;
    [self.detailTextLabel setTextAlignment:NSTextAlignmentRight];
    
   // [self bringSubviewToFront:self.headerImageView];
}
@end
