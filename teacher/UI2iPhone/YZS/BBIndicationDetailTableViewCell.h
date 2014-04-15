//
//  BBIndicationDetailTableViewCell.h
//  BBTeacher
//
//  Created by xxx on 14-3-5.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"
#import "BBOADetailModel.h"

@protocol BBIndicationDetailTableViewCellDelegate;

@interface BBIndicationDetailTableViewCell : UITableViewCell
{
    
    UILabel *time;
    
    UIImageView *back;
    
    UILabel *title;
    EGOImageView *thumbnail;
    UILabel *content;
    
    UIImageView *line;
    UIButton *share;
}
@property(nonatomic,weak) id<BBIndicationDetailTableViewCellDelegate> delegate;
@property(nonatomic,strong) BBOADetailModel *data;
@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@protocol BBIndicationDetailTableViewCellDelegate <NSObject>
-(void)bbIndicationDetailTableViewCell:(BBIndicationDetailTableViewCell *)cell shareTaped:(UIButton *)send;
@end