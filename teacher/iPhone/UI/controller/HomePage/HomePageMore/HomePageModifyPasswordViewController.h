//
//  HomePageModifyPasswordViewController.h
//  iCouple
//
//  Created by ming bright on 12-5-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomAlertView.h"

@interface HPMPNavgationBar : UIView
{
    UIButton *leftButton;
    UIButton *rightButton;
}
@property (nonatomic,strong) UIButton *rightButton;
-(void)addTarget:(id)target leftAction:(SEL)action1 rightAction:(SEL)action2 forControlEvents:(UIControlEvents)controlEvents;
@end


@interface HomePageModifyPasswordViewController : UIViewController<UITextFieldDelegate>{
    
    
    HPMPNavgationBar *navBar;
    
    UIButton *baseView;
    
    UIImageView *oldBackground;
    UIImageView *newBackground;
    
    UIImageView *errorIconOld;
    UIImageView *errorIconNew;
    UILabel *oldTipLabel;
    UILabel *newTipLabel;
    
    
    UITextField *oldPassword;
    UITextField *newPassword;
    
    LoadingView *loadingView;
}

@end
