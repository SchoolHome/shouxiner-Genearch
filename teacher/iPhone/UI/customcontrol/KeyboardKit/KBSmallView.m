//
//  KBSmallView.m
//  Keyboard_dev
//
//  Created by ming bright on 12-7-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KBSmallView.h"



#define kWidthOfSmall  45  // 114/2
#define kHeightOfSmall 57
#define kLeftPaddingOfSmall    2.5

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
@implementation KBSmallView
@synthesize delagate;
@synthesize smallData = _smallData;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        for (int i = 0; i<20; i++) {
            _item[i] = [[KBSmallItem alloc] init];
            _item[i].backgroundColor = [UIColor clearColor];

        }
        _deleteButton = [[UIButton alloc] init];
        [_deleteButton setBackgroundImage:[UIImage imageNamed:@"emotion_bg_normal_press"] forState:UIControlStateHighlighted];
    }
    return self;
}

-(void)setSmallData:(NSArray *)smallData_{
    
    if (![_smallData isEqual:smallData_]) {
        _smallData = smallData_;
        for (int i = 0; i<20; i++) {
            
            int row = i/7;   // 行数
            int line = i%7;  // 列数
            
            _item[i].frame = CGRectMake(kLeftPaddingOfSmall+kWidthOfSmall*line, 5+row*(kHeightOfSmall+2), kWidthOfSmall, kHeightOfSmall);
            [_item[i] addTarget:self action:@selector(smallTaped:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_item[i]];
            [_item[i] setSmallItemData:[_smallData objectAtIndex:i]];
            
        }
        
        _deleteButton.frame = CGRectMake(kLeftPaddingOfSmall+6*kWidthOfSmall, 5+2*(kHeightOfSmall+2), kWidthOfSmall, kHeightOfSmall);
        [_deleteButton setImage:[UIImage imageNamed:@"btn_im_cancle_02"] forState:UIControlStateNormal];
        [_deleteButton setImage:[UIImage imageNamed:@"btn_im_cancle_02_hover"] forState:UIControlStateHighlighted];
        [_deleteButton addTarget:self action:@selector(smallDeleteTaped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_deleteButton];
    }
}

-(void)smallTaped:(KBSmallItem *)sender{
    // 动画
    CPUIModelPetSmallAnim *anim = [[CPUIModelManagement sharedInstance] smallAnimObectOfEscapeChar:sender.smallItemData.escapeChar];
    if (anim) {
        
        NSArray *slides = [anim allAnimSlides];
        CGFloat duration = 0.05f;
        
        if ([slides count]>0) {
            CPUIModelAnimSlideInfo *info = [[anim allAnimSlides] objectAtIndex:0];
            duration = [info.duration floatValue]/1000.0f;
        }
        
        sender.animImageView.animationImages = [anim animImgArray];
        sender.animImageView.animationDuration = [[anim allAnimSlides] count]*duration;
        sender.animImageView.animationRepeatCount = 1;
        [sender.animImageView startAnimating];
        
    }
    // 回调
    if(self.delagate&&[self.delagate respondsToSelector:@selector(smallTaped:)]){
        [self.delagate smallTaped:sender];
    }
}

-(void)smallDeleteTaped:(UIButton *)sender{
    if(self.delagate&&[self.delagate respondsToSelector:@selector(smallDeleteTaped:)]){
        [self.delagate smallDeleteTaped:sender];
    }
}

@end


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
@implementation KBSmallItem
@synthesize smallItemData = _smallItemData;

@synthesize animImageView = _animImageView;
@synthesize nameLabel = _nameLabel;

-(id)init{
    if (self = [super init]) {
        
        [self setBackgroundImage:[UIImage imageNamed:@"emotion_bg_normal_press"] forState:UIControlStateHighlighted];
        _animImageView = [[UIImageView alloc] init];
        _animImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:_animImageView];
        _animImageView.image = nil;
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.textAlignment = UITextAlignmentCenter;
        _nameLabel.textColor =[UIColor colorWithHexString:@"#9A9A9A"];
        _nameLabel.text = @"";
        [self addSubview:_nameLabel];
        
    }
    return self;
}


-(void)setSmallItemData:(CPUIModelPetSmallAnim *)smallItemData_{
    
    if (![_smallItemData isEqual:smallItemData_]) {
        _smallItemData = smallItemData_;
        UIImage *image = [UIImage imageWithContentsOfFile:_smallItemData.thumbNail];
        _animImageView.image = image;
        _nameLabel.text = [_smallItemData name];
    }
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    _animImageView.frame = CGRectMake((frame.size.width-35)/2, 5, 35, 35);
    
    _nameLabel.frame = CGRectMake(_animImageView.frame.origin.x, 
                                  _animImageView.frame.origin.y+_animImageView.frame.size.height+3,
                                  _animImageView.frame.size.width, 
                                  10);
}

@end


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


