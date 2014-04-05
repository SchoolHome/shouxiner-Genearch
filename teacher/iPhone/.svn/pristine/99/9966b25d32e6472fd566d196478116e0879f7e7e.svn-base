//
//  KBemojiView.m
//  Keyboard_dev
//
//  Created by ming bright on 12-7-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KBEmojiView.h"

#define kWidthOfEmoji   (90/2)
#define kHeightOfEmoji  (91/2)

#define kLeftPaddingOfEmoji  2.5



///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

@implementation KBEmojiView
@synthesize delagate;
@synthesize emojiData = _emojiData;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        for (int i = 0; i<28; i++) {
            _item[i] = [[KBEmojiItem alloc] init];
            _item[i].backgroundColor = [UIColor clearColor];
        }
        _deleteButton = [[UIButton alloc] init];
        [_deleteButton setBackgroundImage:[UIImage imageNamed:@"emotion_bg_emoji_press_01"] forState:UIControlStateHighlighted];
    }
    return self;
}


-(void)setEmojiData:(NSArray *)emojiData_{
    
    if (![_emojiData isEqualToArray:emojiData_]) {
        _emojiData = emojiData_;
        
        int i = 0;
        if ([_emojiData count]<=27) {
            for (NSString *str in _emojiData) {
                
                NSString *emoji = [[str componentsSeparatedByString:@","] lastObject];
                NSString *codedEmoji = [[str componentsSeparatedByString:@","] objectAtIndex:0];
                _item[i].nativeEmoji = emoji;
                _item[i].codedEmoji = codedEmoji;
                
                int row = i/7;   // 行数
                int line = i%7;  // 列数
                _item[i].frame = CGRectMake(kLeftPaddingOfEmoji+line*kWidthOfEmoji, row*kHeightOfEmoji+5, kWidthOfEmoji, kHeightOfEmoji);
                [_item[i] addTarget:self action:@selector(emojiTaped:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:_item[i]];
                
                i++;
            }
        }
        
        _deleteButton.frame = CGRectMake(kLeftPaddingOfEmoji+6*kWidthOfEmoji, 3*kHeightOfEmoji+5, kWidthOfEmoji, kHeightOfEmoji);
        [_deleteButton setImage:[UIImage imageNamed:@"btn_im_cancle"] forState:UIControlStateNormal];
        [_deleteButton setImage:[UIImage imageNamed:@"btn_im_cancle_hover"] forState:UIControlStateHighlighted];
        [_deleteButton addTarget:self action:@selector(emojiDeleteTaped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_deleteButton];
    }
    

}


-(void)emojiTaped:(KBEmojiItem *)sender{
    if(self.delagate&&[self.delagate respondsToSelector:@selector(emojiTaped:)]){
        [self.delagate emojiTaped:sender];
    }
}

-(void)emojiDeleteTaped:(UIButton *)sender{
    if(self.delagate&&[self.delagate respondsToSelector:@selector(emojiDeleteTaped:)]){
        [self.delagate emojiDeleteTaped:sender];
    }
}

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

@implementation KBEmojiItem

@synthesize nativeEmoji = _nativeEmoji;
@synthesize codedEmoji  = _codedEmoji;

-(id)init{
    if (self = [super init]) {
        [self setBackgroundImage:[UIImage imageNamed:@"emotion_bg_emoji_press_01"] forState:UIControlStateHighlighted];
        _emojiLabel = [[UILabel alloc] init];
        _emojiLabel.backgroundColor = [UIColor clearColor];
        _emojiLabel.textAlignment = UITextAlignmentCenter;
        _emojiLabel.font = [UIFont fontWithName:@"AppleColorEmoji" size:35];
        [self addSubview:_emojiLabel];
    }
    return self;
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    _emojiLabel.frame = CGRectMake(0, 5, 45, 45);
    
}

-(void)setNativeEmoji:(NSString *)nativeEmoji_{
    
    if (![_nativeEmoji isEqualToString:nativeEmoji_]) {
        _nativeEmoji = nativeEmoji_;
        _emojiLabel.text = _nativeEmoji;
    }
}

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
