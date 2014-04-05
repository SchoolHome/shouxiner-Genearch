//
//  FXBlockViewCheckBoxDelegate.h
//  iCouple
//
//  Created by lixiaosong on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FXBlockViewCheckBoxDelegate <NSObject>
- (void)actionblockViewCheckBoxCloseButtonTouched;
- (void)actionBlockViewCheckBoxSubmitButtonTouched;
- (void)actionBlockViewCheckBoxCheckBoxButtonTouched;
@end
