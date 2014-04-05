//
//  FXBlockViewCheckBox.m
//  iCouple
//
//  Created by lixiaosong on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXBlockViewCheckBox.h"
@interface FXBlockViewCheckBox(private)
- (void)doRespondToSubmitButtonTouched;
- (void)doRespondToCheckButtonTouched;
@end
@implementation FXBlockViewCheckBox
@synthesize delegate = _delegate;
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
    _submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_submitButton addTarget:self action:@selector(doRespondToSubmitButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    
    _checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_checkButton addTarget:self action:@selector(doRespondToCheckButtonTouched) forControlEvents:UIControlEventTouchUpInside];
    
    [groundView addSubview:_submitButton];
    [groundView addSubview:_checkButton];
}
- (void)doInitConfig{
    [super doInitConfig];
}
- (void)doRespondToCloseButtonTouched{
    [super doRespondToCloseButtonTouched];
    [self.delegate actionblockViewCheckBoxCloseButtonTouched];
}
- (void)doRespondToSubmitButtonTouched{
    [self.delegate actionBlockViewCheckBoxSubmitButtonTouched];
}
- (void)doRespondToCheckButtonTouched{
    [self.delegate actionBlockViewCheckBoxCheckBoxButtonTouched];
}
@end
