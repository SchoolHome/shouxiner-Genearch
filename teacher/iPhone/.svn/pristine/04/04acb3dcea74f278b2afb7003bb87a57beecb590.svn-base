//
//  FXBlockViewSubmit.m
//  iCouple
//
//  Created by lixiaosong on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//



#import "FXBlockViewSubmit.h"
#import "TBundleOperator.h"
#import "CBlockViewConfig.h"
@implementation FXBlockViewSubmit
@synthesize delegate = _delegate;
@synthesize centerButton = _centerButton;
- (id)init{
    self = [super init];
    if(self){
        [self doInitComponent];
        [self doInitConfig];
    }
    return self;
}
- (void)doInitComponent{
    [super doInitComponent];
    _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_centerButton setFrame:CGRectMake(CENTER_BUTTON_X, CENTER_BUTTON_Y, CENTER_BUTTON_W, CENTER_BUTTON_H)];
    [_centerButton addTarget:self action:@selector(doRespondToCenterButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    [_centerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_centerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_centerButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [groundView addSubview:_centerButton];
}
- (void)doInitConfig{
    [super doInitConfig];
    
    UIImage * defaultNormalImage = [[TBundleOperator sharedInstance] doGetImageFromImageNormalBundleWithFileName:@"btn_small.png"];
    UIImage * defaultHighlightImage = [[TBundleOperator sharedInstance] doGetImageFromImageNormalBundleWithFileName:@"btn_small_hover.png"];
    [self doSetCenterButtonNormalImage:defaultNormalImage highlightImage:defaultHighlightImage];
    [self doSetCenterButtonNormalTitle:@"确定" highlightTitle:@"确定"];
}
#pragma mark Set
- (void)doSetCenterButtonNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle{

    [_centerButton setTitle:normalTitle forState:UIControlStateNormal];
    [_centerButton setTitle:highlightTitle forState:UIControlStateHighlighted];
}
- (void)doSetCenterButtonNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage{
    [_centerButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [_centerButton setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
}
#pragma mark Action
- (void)doRespondToCloseButtonTouched{
    [super doRespondToCloseButtonTouched];
    [self.delegate actionBlockViewCloseButtonTouchedSender:closeButton];
}
- (void)doRespondToCenterButtonTouched{
    [self doHideBlockView];
    [self.delegate actionBlockViewCenterButtonTouchedSender:_centerButton];
}

- (void)doSetText:(NSString *)textString{
    [super doSetText:textString];
    
    CGSize contentSize = textView.contentSize;
    CGRect contentFrame = CGRectMake(TEXT_VIEW_X, TEXT_VIEW_Y, contentSize.width, contentSize.height);
    [textView setFrame:contentFrame];
    
    [blockView setFrame:CGRectMake(BLOCK_VIEW_X, BLOCK_VIEW_Y,BLOCK_VIEW_W, TEXT_VIEW_HEADER+contentFrame.size.height+TEXT_VIEW_FOOTER )];
    
    [_centerButton setFrame:CGRectMake(CENTER_BUTTON_X, TEXT_VIEW_Y+contentSize.height, CENTER_BUTTON_W, CENTER_BUTTON_H)];
    
}
@end
