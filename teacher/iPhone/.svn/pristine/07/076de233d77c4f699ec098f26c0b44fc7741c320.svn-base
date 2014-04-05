//
//  EventTableViewCell.m
//  iCouple
//
//  Created by yong wei on 12-3-28.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "EventTableViewCell.h"

@implementation EventTableViewCell
@synthesize addButton = _addButton , buttonTitleFont = _buttonTitleFont , descriptionSucceedLabel = _descriptionSucceedLabel , succeedImage = _succeedImage , descriptionFailLabel = _descriptionFailLabel;
@synthesize activityIndicator = _activityIndicator , isShuangShuangRecommon = _isShuangShuangRecommon;
@synthesize headView = _headView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.buttonTitleFont = [UIFont fontWithName:@"Times New Roman" size:12.0f];
        
        self.descriptionSucceedLabel = [[UILabel alloc] initWithFrame:CGRectMake(197.0f, self.frame.origin.y + 2.0f, 76.0f, 40.0f)];
        self.descriptionSucceedLabel.textAlignment = UITextAlignmentLeft;
        self.descriptionSucceedLabel.font = self.nickNameFont;
        self.descriptionSucceedLabel.hidden = YES;
        self.descriptionSucceedLabel.text = @"等Ta回复：）";//等待对方确定
        self.descriptionSucceedLabel.textColor = [UIColor grayColor];
        [self addSubview:self.descriptionSucceedLabel];
        
        self.descriptionFailLabel = [[UILabel alloc] initWithFrame:CGRectMake(222.0f, self.frame.origin.y + 2.0f, 24.0f, 40)];
        self.descriptionFailLabel.textAlignment = UITextAlignmentLeft;
        self.descriptionFailLabel.font = self.nickNameFont;
        self.descriptionFailLabel.hidden = YES;
        self.descriptionFailLabel.text = @"失败";
        self.descriptionFailLabel.textColor = [UIColor grayColor];
        [self addSubview:self.descriptionFailLabel];
        
        // 笑脸
        self.succeedImage = [[UIImageView alloc] initWithFrame:CGRectMake(273.0f, self.frame.size.height / 2.0f - 16.0f / 2.0f, 16.0f, 16.0f)];
        self.succeedImage.image = [UIImage imageNamed:@"icon_face_smile.png"];
        self.succeedImage.hidden = YES;
        [self addSubview:self.succeedImage];
        
        // 添加按钮
        self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.addButton setBackgroundImage:[UIImage imageNamed:@"addressbook_btn_add_nor"] forState:UIControlStateNormal];
        [self.addButton setBackgroundImage:[UIImage imageNamed:@"addressbook_btn_add_press"] forState:UIControlStateHighlighted];
        self.addButton.frame = CGRectMake(253.0f, self.frame.size.height /2.0f - 25 / 2.0f , 50, 25);
        [self.addButton setTitle:@"添加" forState:UIControlStateNormal];
        self.addButton.titleLabel.font = self.buttonTitleFont;
        // 设置文字偏离
        [self.addButton setTitleEdgeInsets:UIEdgeInsetsMake(4.0f, 0.0f, 0.0f, 0.0f)];
        [self.addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:self.addButton];
        
        // 风火轮
        self.activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(273.0f, self.frame.size.height / 2.0f - 16.0f / 2.0f, 16.0f, 16.0f)];
        self.activityIndicator.hidden = YES;
        [self.activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:self.activityIndicator];
        self.isShuangShuangRecommon = NO;
        
        self.headView = [[HPHeadView alloc] initWithFrame:CGRectMake(18.0f, 4.0f, 35.0f, 35.0f)];
        [self.headView setBorderWidth:5.f];
        [self.headView setCycleImage:[UIImage imageNamed:@"headpic_index_50x50.png"]];
        [self addSubview:self.headView];
    }
    return self;
}

// 切换到单元格loading状态
-(void) changeCellForLoading{
    self.addButton.hidden = YES;
    self.descriptionFailLabel.hidden = YES;
    self.activityIndicator.hidden = NO;
}

// 切换到单元格成功状态
-(void) changeCellForSucceed{
    [self.activityIndicator stopAnimating];
    self.addButton.hidden = YES;
    self.succeedImage.hidden = NO;
    self.descriptionSucceedLabel.hidden = NO;
    [self.descriptionSucceedLabel bringSubviewToFront:self];
    self.descriptionFailLabel.hidden = YES;
}

-(void) changeCellForSucceedForCloseFriend{
    [self.activityIndicator stopAnimating];
    self.addButton.hidden = YES;
    self.succeedImage.hidden = NO;
    self.descriptionSucceedLabel.text = @"加蜜友成功";
    [self.descriptionSucceedLabel bringSubviewToFront:self];
    self.descriptionSucceedLabel.hidden = NO;
    self.descriptionFailLabel.hidden = YES;
}

// 切换到单元格失败状态
-(void) changeCellForFail{
    [self.activityIndicator stopAnimating];
    self.addButton.hidden = NO;
    self.descriptionFailLabel.hidden = NO;
}

-(void) startTimer{
    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(changeCellForSucceedNoText) userInfo:nil repeats:NO];
}

// 切换到没有文本信息的提示状态
-(void) changeCellForSucceedNoText{
    self.descriptionSucceedLabel.hidden = YES;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];

}

@end
