//
//  GroupSoundExpressionCell.m
//  iCouple
//
//  Created by ming bright on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GroupSoundExpressionCell.h"

@implementation GroupSoundExpressionCell


- (void)createAvatar{
   [self createAvatarControl];
}
- (void)refreshCell{
    [super refreshCell];
    avatar.frame = CGRectMake(ellipticalBackground.frame.origin.x - kAvatarWidth+ 8, ellipticalBackground.frame.origin.y, kAvatarWidth, kAvatarHeight);
    //[avatar setBackgroundImage:self.userHeadImage forState:UIControlStateNormal];
    
    if (!self.userHeadImage) {
        avatar.backImage = [UIImage imageNamed:@"headpic_index_normal_120x120"];
    }else {
        avatar.backImage = self.userHeadImage;
    }
}

@end
