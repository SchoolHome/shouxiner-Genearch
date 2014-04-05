//
//  CBlockView.h
//  TestLoading
//
//  Created by lixiaosong on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class TBundleOperator;
@interface CBlockView : NSObject{
    @protected
    UIView * groundView;
    UIView * blockView;
    UITextView * textView;
    UIButton * closeButton;
    TBundleOperator * bundleOperator;
}


- (void)doInitConfig;
- (void)doInitComponent;

- (void)doShowBlockViewInView:(UIView *)view;
- (void)doShowBlockViewInViewController:(UIView *)viewController;
- (void)doHideBlockView;
- (void)doRespondToCloseButtonTouched;

- (void)doSetText:(NSString *)textString;




@end
