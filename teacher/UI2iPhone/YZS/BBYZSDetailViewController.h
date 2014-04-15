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
#import "BBOADetailModel.h"

typedef enum{
    OALoadStatusRefresh, // 刷新
    OALoadStatusAppend,  // 追加
} OALoadStatus;

@interface BBYZSDetailViewController : PalmViewController
<UITableViewDataSource,UITableViewDelegate,
BBIndicationDetailTableViewCellDelegate>
{
    UITableView *yzsDetailTableView;

    
}

@property(nonatomic,strong) BBOAModel *oaModel;

@property(nonatomic) OALoadStatus loadStatus;

@end
