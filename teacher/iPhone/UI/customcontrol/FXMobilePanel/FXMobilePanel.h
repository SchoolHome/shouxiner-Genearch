//
//  FXMobilePanel.h
//  iCouple
//
//  Created by lixiaosong on 12-3-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FXMobilePanel : UIView
@property (nonatomic, retain) UILabel * info_label_left;
@property (nonatomic, retain) UILabel * info_label_number;
@property (nonatomic, retain) UILabel * info_label_right;
- (void)do_set_mobile_string:(NSString *)mobile_string;
@end
