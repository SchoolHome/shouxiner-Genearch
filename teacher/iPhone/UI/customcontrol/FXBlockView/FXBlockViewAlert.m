//
//  FXBlockViewAlert.m
//  iCouple
//
//  Created by lixiaosong on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXBlockViewAlert.h"

@implementation FXBlockViewAlert
@synthesize delegate = _delegate;
- (id)init{
    self = [super init];
    if(self){
        [self doInitComponent];
        [self doInitConfig];
    }
    return self;
}
- (void)doInitConfig{
    [super doInitConfig];
    [self doSetLeftButtonNormalTitle:@"确定" highlightTitle:@"确定"];
    [self doSetRightButtonNormalTitle:@"取消" highlightTitle:@"取消"];
}
- (void)doInitComponent{
    [super doInitComponent];
    leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(20, 100, 100, 50)];
    [leftButton addTarget:self action:@selector(doRespondToLeftButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    
    rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [rightButton setFrame:CGRectMake(150, 100, 100, 50)];
    [rightButton addTarget:self action:@selector(doRespondToRightButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    
    [blockView addSubview:leftButton];
    [blockView addSubview:rightButton];
}
#pragma mark Set
- (void)doSetLeftButtonNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle{
    [leftButton setTitle:normalTitle forState:UIControlStateNormal];
    [leftButton setTitle:highlightTitle forState:UIControlStateHighlighted];
}
- (void)doSetLeftButtonNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage{
    [leftButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [leftButton setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
}

- (void)doSetRightButtonNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle{
    [rightButton setTitle:normalTitle forState:UIControlStateNormal];
    [rightButton setTitle:highlightTitle forState:UIControlStateHighlighted];
}
- (void)doSetRightButtonNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage{
    [rightButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [rightButton setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
}
#pragma mark Action
- (void)doRespondToCloseButtonTouched{
    [super doRespondToCloseButtonTouched];
    [self.delegate actionBlockViewCloseButtonTouchedSender:closeButton];
}
- (void)doRespondToLeftButtonTouched{
    [self doHideBlockView];
    [self.delegate actionBlockViewLeftButtonTouchedSender:leftButton];
}
- (void)doRespondToRightButtonTouched{
    [self doHideBlockView];
    [self.delegate actionBlockViewRightButtonTouchedSender:rightButton];
}
- (void)doSetText:(NSString *)textString{
    [super doSetText:textString];
    CGSize contentSize = textView.contentSize;
    CGRect textFrame = textView.frame;
    [textView setFrame:CGRectMake(textFrame.origin.x, textFrame.origin.y, contentSize.width, contentSize.height)];
    
    CGRect blockFrame = groundView.frame;
    [blockView setFrame:CGRectMake(20, blockFrame.origin.y, 280, contentSize.height+80)];
}
@end
