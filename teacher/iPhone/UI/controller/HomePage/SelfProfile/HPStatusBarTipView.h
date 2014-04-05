//
//  HPStatusBarTipView.h
//  statusBar_dev
//
//  Created by ming bright on 12-6-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPUIModelMessageGroup.h"

@protocol HPStatusBarTipViewDelegate;

@interface HPStatusBarTipView : UIWindow
{
    UIButton *baseView;
    UIImageView *imageView;
    UILabel *msgLabel;
    UILabel *countLabel;
    NSInteger msgCount;
    
    CPUIModelMessageGroup *_modeMsgGroup;
}
@property(nonatomic,assign) id<HPStatusBarTipViewDelegate> delegate;
@property(nonatomic,strong) CPUIModelMessageGroup *modeMsgGroup;
+(HPStatusBarTipView *)shareInstance;


-(void)showMessage:(NSString *)message msgGroup:(CPUIModelMessageGroup *)group infoCount:(NSInteger)count;  // 2.5s 自动消失
-(void)showMessage:(NSString *)message msgGroup:(CPUIModelMessageGroup *)group infoCount:(NSInteger)count duration:(NSTimeInterval)duration;
-(void)dismiss;

@end

@protocol HPStatusBarTipViewDelegate <NSObject>
-(void)statusBarTipViewTaped:(HPStatusBarTipView *)tipView;
@end