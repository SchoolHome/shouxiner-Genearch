//
//  HPSwitch.h
//  HomePageSelfProfileViewController
//
//  Created by ming bright on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPSwitch : UISlider {
	BOOL on;

	UIView *clippingView;
	UILabel *rightLabel;
	UILabel *leftLabel;

}

@property(nonatomic,getter=isOn) BOOL on;
@property (nonatomic,strong) UIView *clippingView;
@property (nonatomic,strong) UILabel *rightLabel;
@property (nonatomic,strong) UILabel *leftLabel;

//@property (nonatomic,strong) UIImage *

+ (HPSwitch *) switchWithLeftText: (NSString *) tag1 andRight: (NSString *) tag2;

- (void)setOn:(BOOL)on animated:(BOOL)animated;


@end
