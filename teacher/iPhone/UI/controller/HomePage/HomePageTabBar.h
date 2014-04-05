//
//  HomePageTabBar.h
//  MainPage_dev
//
//  Created by ming bright on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


////////////////////////////////////////////////////////////////////////////////////

@interface HPBadgeView : UIImageView
{
    UILabel *label;
}
-(void)setBadge:(int) number;
@end

////////////////////////////////////////////////////////////////////////////////////

@interface HPCoupleButton : UIButton
{
    HPBadgeView  *coupleBadge;
    UILabel *nickLabel;
}

-(void)layoutCoupleButton;
-(void)updateCoupleBadge:(int) number;

@end


////////////////////////////////////////////////////////////////////////////////////

@interface HPNCButton : UIButton
{
    HPBadgeView  *coupleBadge;
}

-(void)updateCoupleBadge:(int) number;

@end

