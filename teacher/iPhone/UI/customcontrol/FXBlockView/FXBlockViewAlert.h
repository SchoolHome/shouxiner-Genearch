//
//  FXBlockViewAlert.h
//  iCouple
//
//  Created by lixiaosong on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CBlockView.h"
#import "FXBlockViewAlertDelegate.h"
@interface FXBlockViewAlert : CBlockView{
    @private
    UIButton * leftButton;
    UIButton * rightButton;
}
@property (nonatomic, assign) id<FXBlockViewAlertDelegate>delegate;
- (void)doSetLeftButtonNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle;
- (void)doSetLeftButtonNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage;

- (void)doSetRightButtonNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle;
- (void)doSetRightButtonNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage;

- (void)doRespondToLeftButtonTouched;
- (void)doRespondToRightButtonTouched;
@end
