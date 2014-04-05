//
//  HPSexPickerView.h
//  HomePageSelfProfileViewController
//
//  Created by ming bright on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPUIModelPersonalInfo.h"

@interface HPSexPicker : UIControl
{
    UIView *baseView;
    
    UIImageView *male;
    UIImageView *female;

    
    PersonalInfoSexType sex;
}

- (id)initWithFrame:(CGRect)frame sex:(PersonalInfoSexType) sex_;

- (void)setMaleImage:(UIImage *)image;
- (void)setFemaleImage:(UIImage *)image;
-(void)setSex:(PersonalInfoSexType) sex_;
- (PersonalInfoSexType)sex;

@end
