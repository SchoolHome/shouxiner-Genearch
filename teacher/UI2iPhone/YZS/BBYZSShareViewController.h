//
//  BBYZSShareViewController.h
//  teacher
//
//  Created by xxx on 14-3-20.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "PalmViewController.h"
#import "UIPlaceHolderTextView.h"

#import "BBOADetailModel.h"


@interface BBYZSShareViewController : PalmViewController
{

    UIPlaceHolderTextView *thingsTextView;
}

@property(nonatomic,strong) BBOADetailModel *oaDetailModel;

@end
