//
//  ChatInforCellBase.m
//  iCouple
//
//  Created by wang shuo on 12-4-28.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "ChatInforCellBase.h"

@implementation ChatInforCellBase

@synthesize maxBubbleLineWidth = _maxBubbleLineWidth , bubbleLineTopPadding = _bubbleLineTopPadding , bubbleLineBottomPadding = _bubbleLineBottomPadding , bubbleLineLeftPadding = _bubbleLineLeftPadding , bubbleLineRightPadding = _bubbleLineRightPadding;

@synthesize isBelongMe = _isBelongMe , pictruePathIsBelongMe = _pictruePathIsBelongMe , pictruePathNotBelongMe = _pictruePathNotBelongMe;
@synthesize userHeadImage = _userHeadImage;
@synthesize messageCellType = _messageCellType;
@synthesize delegate = _delegate;
@synthesize data = _data;


- (id)initWithType : (MessageCellType) messageCellType withBelongMe:(BOOL)isBelongMe withKey : (NSString *) key{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:key];
    if (self) {
        // 边界
        _maxBubbleLineWidth = 0.0f;
        _bubbleLineTopPadding = 0.0f;
        _bubbleLineBottomPadding = 0.0f;
        _bubbleLineLeftPadding = 0.0f;
        _bubbleLineRightPadding = 0.0f;
        
        _isBelongMe = isBelongMe;
        self.backgroundColor = [UIColor clearColor];
        // 图片路径
        _pictruePathIsBelongMe = @"";
        _pictruePathNotBelongMe = @"";
        
        _messageCellType = messageCellType;
        
    }
    return self;
}

-(void)setData:(id)data_{
    _data = data_;
    [self refreshCell];
}

- (void)refreshCell{
    //子类实现刷新cell内容
    [self refreshResendButton];
    [self refreshAvatar];
}

- (void)refreshResendButton{
    //子类实现
}

- (void)refreshAvatar{
    //子类实现
}





















@end
