//
//  HPTopTipView.h
//  iCouple
//
//  Created by ming bright on 12-5-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPTopTipView : UIView
{
    UILabel *messageLabel;
    
}

+(HPTopTipView *)shareInstance;

-(void)showMessage:(NSString *)message;    // 默认2.5s自动消失
-(void)showMessage:(NSString *)message duration:(NSTimeInterval)duration;

@end
