//
//  BBBJDropdownView.h
//  teacher
//
//  Created by xxx on 14-3-17.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBGroupModel.h"

@protocol BBBJDropdownViewDelegate;
@interface BBBJDropdownView : UIControl<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_list;
}

@property (nonatomic,weak) id<BBBJDropdownViewDelegate> delegate;
@property (nonatomic,strong) NSArray *listData;
@property BOOL unfolded;

-(void)show;
-(void)dismiss;

@end

@protocol BBBJDropdownViewDelegate <NSObject>

-(void)bbBJDropdownView:(BBBJDropdownView *) dropdownView_ didSelectedAtIndex:(NSInteger) index_;
-(void)bbBJDropdownViewTaped:(BBBJDropdownView *) dropdownView_;

@end