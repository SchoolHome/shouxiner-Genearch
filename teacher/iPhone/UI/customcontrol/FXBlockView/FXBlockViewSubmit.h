//
//  FXBlockViewSubmit.h
//  iCouple
//
//  Created by lixiaosong on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CBlockView.h"
#import "FXBlockViewSubmitDelegate.h"
@interface FXBlockViewSubmit : CBlockView
{
    @private
    UIButton * _centerButton;
}
@property (nonatomic, assign) id<FXBlockViewSubmitDelegate>delegate;
@property (nonatomic, retain) UIButton * centerButton;
- (void)doSetCenterButtonNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle;
- (void)doSetCenterButtonNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage;
@end
