//
//  BBIndicationTableViewCell.m
//  BBTeacher
//
//  Created by xxx on 14-3-5.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "BBIndicationTableViewCell.h"

@implementation BBIndicationTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        icon = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
        [self addSubview:icon];
        icon.backgroundColor = [UIColor grayColor];
        
        CALayer *roundedLayer = [icon layer];
        [roundedLayer setMasksToBounds:YES];
        roundedLayer.cornerRadius = 25.0;
        //roundedLayer.borderWidth = 2;
        roundedLayer.borderColor = [[UIColor grayColor] CGColor];
        
        
        mark = [[UILabel alloc] initWithFrame:CGRectMake(40, 3, 20, 20)];
        [self addSubview:mark];
        mark.backgroundColor = [UIColor orangeColor];
        mark.textAlignment = NSTextAlignmentCenter;
        CALayer *roundedLayer1= [mark layer];
        //[roundedLayer setMasksToBounds:YES];
        roundedLayer1.cornerRadius = 10.0;
        roundedLayer1.borderWidth = 0.5;
        roundedLayer1.borderColor = [[UIColor grayColor] CGColor];
        
        
        title = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, 230, 20)];
        [self addSubview:title];
        
        time = [[UILabel alloc] initWithFrame:CGRectMake(260, 5, 50, 20)];
        [self addSubview:time];
        
        content = [[UILabel alloc] initWithFrame:CGRectMake(70, 30, 230, 20)];
        [self addSubview:content];
        
        
        title.font = [UIFont systemFontOfSize:14];
        time.font = [UIFont systemFontOfSize:14];
        content.font = [UIFont systemFontOfSize:14];
        
        mark.font = [UIFont systemFontOfSize:9];
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(id)data{
    _data = data;
    
    title.text = @"XX总局";
    
    time.text = @"12:23";
    
    int m = arc4random()%25+1;
    
    mark.text = [NSString stringWithFormat:@"%d",m];
    [mark sizeThatFits:CGSizeMake(20, 20)];
    
    content.text = @"XX总局重要指示，！＃@¥％％……％&＊&¥％¥＃％…………&&＊";
    
    icon.image = [UIImage imageNamed:@"girl"];
}

@end
