//
//  AFTableViewCell.h
//  AllFriends_dev
//
//  Created by ming bright on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHeadItem.h"

@protocol AFTableViewCellDelegate;

@interface AFTableViewCell : UITableViewCell<AFHeadItemDelegate>
{
    id<AFTableViewCellDelegate> __weak _delegate;
    AFHeadItem *_item[4];
    
    NSArray *_cellData;
    NSIndexPath *_cellIndexPath;
}
@property(nonatomic,weak) id delegate;
@property(nonatomic,strong) NSArray *cellData;
@property(nonatomic,strong) NSIndexPath *cellIndexPath;
@end

@protocol AFTableViewCellDelegate <NSObject>
//
@end