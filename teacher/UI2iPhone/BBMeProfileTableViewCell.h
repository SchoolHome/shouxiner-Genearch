//
//  BBMeProfileTableViewCell.h
//  teacher
//
//  Created by mac on 14-3-14.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
#import <QuartzCore/QuartzCore.h>
@interface BBMeProfileTableViewCell : UITableViewCell
{
    EGOImageView *headerImageView;
}
@property (nonatomic, strong) EGOImageView *headerImageView;
@end
