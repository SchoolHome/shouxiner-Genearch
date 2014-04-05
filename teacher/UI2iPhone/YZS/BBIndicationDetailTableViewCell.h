//
//  BBIndicationDetailTableViewCell.h
//  BBTeacher
//
//  Created by xxx on 14-3-5.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BBIndicationDetailTableViewCellDelegate;

@interface BBIndicationDetailTableViewCell : UITableViewCell
{
    UIImageView *back;
    
    UILabel *title;
    UIImageView *thumbnail;
    UILabel *content;
    
    UIImageView *line;
    UIButton *share;
}
@property(nonatomic,weak) id<BBIndicationDetailTableViewCellDelegate> delegate;
@property(nonatomic,strong) id data;
@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@protocol BBIndicationDetailTableViewCellDelegate <NSObject>
-(void)bbIndicationDetailTableViewCell:(BBIndicationDetailTableViewCell *)cell shareTaped:(UIButton *)send;
@end