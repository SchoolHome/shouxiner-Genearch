//
//  BBYZSDetailViewController.h
//  BBTeacher
//
//  Created by xxx on 14-3-5.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "PalmViewController.h"
#import "BBIndicationDetailTableViewCell.h"

#import "SVPullToRefresh.h"

#import "BBOAModel.h"

@interface BBYZSDetailViewController : PalmViewController
<UITableViewDataSource,UITableViewDelegate,
BBIndicationDetailTableViewCellDelegate>
{
    UITableView *yzsDetailTableView;

    NSMutableArray *detailList;
}

@property(nonatomic,strong) BBOAModel *oaModel;

@end
