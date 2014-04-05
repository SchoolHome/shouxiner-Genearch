//
//  CoupleBreakIcePageView.h
//  iCouple
//
//  Created by qing zhang on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorUtil.h"
@protocol CoupleBreakIcePageViewDelegate <NSObject>

@optional
//按钮事件
-(void)goHomeController;
//跳转到喜欢的联系人界面
-(void)turnToLikeView;
//跳转到couple的联系人界面
-(void)turnToCoupleView;
//打开actionSheet改变关系
-(void)openActionSheetToChangeRelation;
@end
@interface CoupleBreakIcePageView : UIView
@property (nonatomic , strong) id<CoupleBreakIcePageViewDelegate> coupleBreakIcePageViewDelegate;
@end
