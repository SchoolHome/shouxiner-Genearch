//
//  FXBlockViewInfo.m
//  iCouple
//
//  Created by lixiaosong on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FXBlockViewInfo.h"

@implementation FXBlockViewInfo
@synthesize delegate = _delegate;
- (id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}
- (void)doInitConfig{
    [super doInitConfig];
}
- (void)doRespondToCloseButtonTouched{
    [super doRespondToCloseButtonTouched];
    [self.delegate actionBlockViewCloseButtonTouchedSender:closeButton];
}
- (void)doSetText:(NSString *)textString{
    [super doSetText:textString];
    
    CGSize contentSize = textView.contentSize;
    CGRect textFrame = textView.frame;
    [textView setFrame:CGRectMake(textFrame.origin.x, textFrame.origin.y, contentSize.width, contentSize.height)];
    
    CGRect blockFrame = groundView.frame;
    [blockView setFrame:CGRectMake(20, blockFrame.origin.y, 280, contentSize.height+20)];
}
@end
