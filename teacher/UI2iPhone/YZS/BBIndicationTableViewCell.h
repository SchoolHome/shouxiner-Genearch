//
//  BBIndicationTableViewCell.h
//  BBTeacher
//
//  Created by xxx on 14-3-5.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
#import "BBOAModel.h"

@interface BBIndicationTableViewCell : UITableViewCell
{
    EGOImageView *icon;
    UILabel *mark;
    UILabel *title;
    UILabel *content;
    UILabel *time;
}

@property(nonatomic,strong) BBOAModel *data;

@end
