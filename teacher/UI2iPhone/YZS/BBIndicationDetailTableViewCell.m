//
//  BBIndicationDetailTableViewCell.m
//  BBTeacher
//
//  Created by xxx on 14-3-5.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "BBIndicationDetailTableViewCell.h"

@implementation BBIndicationDetailTableViewCell

-(void)shareTaped:(UIButton *)sender{
    if (_delegate&&[_delegate respondsToSelector:@selector(bbIndicationDetailTableViewCell:shareTaped:)]) {
        [_delegate bbIndicationDetailTableViewCell:self shareTaped:sender];
    }
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        back = [[UIImageView alloc] init];
        [self addSubview:back];
        CALayer *roundedLayer = [back layer];
        [roundedLayer setMasksToBounds:YES];
        roundedLayer.cornerRadius = 8.0;
        roundedLayer.borderWidth = 1;
        roundedLayer.borderColor = [[UIColor lightGrayColor] CGColor];
        
        title = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 280, 25)];
        [self addSubview:title];
        title.backgroundColor = [UIColor clearColor];
        
        thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(20, 50, 280, 200)];
        [self addSubview:thumbnail];
        
        content = [[UILabel alloc] init];
        content.textColor = [UIColor grayColor];
        content.font = [UIFont systemFontOfSize:12];
        content.numberOfLines = 0;
        [self addSubview:content];
        content.backgroundColor = [UIColor clearColor];
        
        line = [[UIImageView alloc] init];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
        
        share = [UIButton buttonWithType:UIButtonTypeCustom];
        //share.backgroundColor = [UIColor grayColor];
        [share setBackgroundImage:[UIImage imageNamed:@"YZSShared"] forState:UIControlStateNormal];
        [self addSubview:share];
        [share addTarget:self action:@selector(shareTaped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    back.frame = CGRectMake(10, 10, 300, self.bounds.size.height-20);
}

-(void)setData:(id)data{
    _data = data;
    
    title.text = @"教育局重要指示";
    thumbnail.backgroundColor = [UIColor magentaColor];
    
    content.frame = CGRectMake(20, 255, 280, 60);
    content.text = @"xxx同志指示：教育局重要指示，教育局重要指示，教育局重要指示，教育局重要指示，教育局重要指示，教育局重要指示，教育局重要指示";
    [content sizeToFit];
    
    line.frame = CGRectMake(10, 330, 300, 1);
    share.frame = CGRectMake(20, 350, 24, 24);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
