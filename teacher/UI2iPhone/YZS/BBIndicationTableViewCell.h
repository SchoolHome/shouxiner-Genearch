//
//  BBIndicationTableViewCell.h
//  BBTeacher
//
//  Created by xxx on 14-3-5.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBIndicationTableViewCell : UITableViewCell
{
    UIImageView *icon;
    UILabel *mark;
    UILabel *title;
    UILabel *content;
    UILabel *time;
}

@property(nonatomic,strong) id data;

@end
