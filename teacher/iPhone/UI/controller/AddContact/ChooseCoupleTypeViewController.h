//
//  ChooseCoupleTypeViewController.h
//  iCouple
//
//  Created by yong wei on 12-4-10.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInforModel.h"
#import "FanxerNavigationBarControl.h"
#import "ColorUtil.h"
#import "ChooseCoupleModel.h"
#import "NavigationBothStyle.h"

typedef enum{
    // 添加联系人couple页面
    ContactChoose,
    // 陌生人porfile页面
    StrangerChoose,
    // Other IM 页面
    OtherChoose,
    // Couple IM 页面
    CoupleChoose
}RequestType;

@interface NotificationContext : NSObject
@property (nonatomic,assign) RequestType requestType;
@property (nonatomic,assign) ChooseedType chooseedType;
@end

@interface ChooseCoupleTypeViewController : UIViewController<FanxerNavigationBarDelegate>
@property (strong,nonatomic) UIImageView *topImageView;
@property (strong,nonatomic) UIImageView *lineImageView;
@property (strong,nonatomic) UIButton *leftButton;
@property (strong,nonatomic) UIButton *rightButton;

@property(strong,nonatomic) UILabel *loverLabel;
@property(strong,nonatomic) UILabel *marriedLabel;

// 凡想NavigationBar
@property (strong,nonatomic) FanxerNavigationBarControl *fnav;

// 字体设置
@property (strong,nonatomic) UIFont *labelFont;
//@property (strong,nonatomic) ChooseCoupleType chooseCoupleType;

-(id) initChooseCoupleTypeView; //: (ChooseCoupleType) chooseCouple;
-(id) initChooseCoupleTypeView : (RequestType) requestType;
@end
