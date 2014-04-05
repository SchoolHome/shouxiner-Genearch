//
//  KBemojiView.h
//  Keyboard_dev
//
//  Created by ming bright on 12-7-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorUtil.h"

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
@class KBEmojiItem;
@protocol KBEmojiViewDelegate;
@interface KBEmojiView : UIView
{
    NSArray *_emojiData;
    
    KBEmojiItem *_item[27];
    UIButton *_deleteButton;

}
@property(nonatomic,assign) id<KBEmojiViewDelegate> delagate;
@property(nonatomic,strong) NSArray *emojiData;

@end

///////////////////////////////////////////////////////////////////////////////


@protocol KBEmojiViewDelegate <NSObject>

-(void)emojiTaped:(KBEmojiItem *)sender;
-(void)emojiDeleteTaped:(UIButton *)sender;

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

@interface KBEmojiItem : UIButton
{
    NSString *_nativeEmoji;
    NSString *_codedEmoji;
    
    UILabel  *_emojiLabel;
    
}
@property(nonatomic,strong) NSString *nativeEmoji;
@property(nonatomic,strong) NSString *codedEmoji;

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////