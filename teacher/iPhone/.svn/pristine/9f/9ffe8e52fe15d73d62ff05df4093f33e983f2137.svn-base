//
//  HPSexPickerView.m
//  HomePageSelfProfileViewController
//
//  Created by ming bright on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HPSexPicker.h"
#import "ColorUtil.h"
#define SEX_CHANGER_WIDTH (68/2)
#define SEX_CHANGER_HIGH  (68/2)


#define kSexInfoMale   @"纯爷们"
#define kSexInfoFemale @"好姑娘"

@implementation HPSexPicker



-(void)setSex:(PersonalInfoSexType) sex_{
    
    sex = sex_;
    
    switch (sex) {
        case PERSONAL_INFO_SEX_MALE:
            [baseView bringSubviewToFront:male];
            break;
        case PERSONAL_INFO_SEX_FEMALE:
            [baseView bringSubviewToFront:female];
            break;  
        default:
            break;
    }
}

- (id)initWithFrame:(CGRect)frame sex:(PersonalInfoSexType) sex_{
    self = [super initWithFrame:frame];
    if (self) {
        //sex = sex_;
        
        baseView = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width -SEX_CHANGER_WIDTH)/2 , 0, SEX_CHANGER_WIDTH, SEX_CHANGER_HIGH)];
        baseView.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(baseViewTaped:)];
        [baseView addGestureRecognizer:tap];
        baseView.exclusiveTouch = YES;

        male = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width -SEX_CHANGER_WIDTH)/2 , 0, SEX_CHANGER_WIDTH, SEX_CHANGER_HIGH)];
        female = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width -SEX_CHANGER_WIDTH)/2 , 0, SEX_CHANGER_WIDTH, SEX_CHANGER_HIGH)];
        male.backgroundColor = [UIColor clearColor];
        female.backgroundColor = [UIColor clearColor];
        
        [self addSubview:baseView];
        [baseView addSubview:male];
        [baseView addSubview:female];
        male.backgroundColor = [UIColor clearColor];
        female.backgroundColor = [UIColor clearColor];
        [self setSex:sex];
        
    }
    return self;
}

- (void)setMaleImage:(UIImage *)image{
    male.image = image;
}
- (void)setFemaleImage:(UIImage *)image{
    female.image = image;
}


- (PersonalInfoSexType)sex{
    return sex;
}

-(void)baseViewTaped:(UITapGestureRecognizer *)gseture{
    
    if (PERSONAL_INFO_SEX_MALE == sex) {
        sex = PERSONAL_INFO_SEX_FEMALE;
    }else {
        sex = PERSONAL_INFO_SEX_MALE;
    }
    
    [self flip];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)flip{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(flipStop)];
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView:baseView cache:YES];
    
    int index1 = [[baseView subviews] indexOfObject:male];
    int index2 = [[baseView subviews] indexOfObject:female];
    
	[baseView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
	[UIView commitAnimations];
    
}

-(void)flipStop{
    [self setSex:sex];
}

@end
