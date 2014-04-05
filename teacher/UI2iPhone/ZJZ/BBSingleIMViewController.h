//
//  BBSingleIMViewController.h
//  teacher
//
//  Created by singlew on 14-3-19.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBIMViewController.h"
#import "SingleProfileView.h"

@interface BBSingleIMViewController : BBIMViewController<SingleProfileViewDelegate,ProfileViewDelegate>

-(id)init : (CPUIModelMessageGroup *)messageGroup;

@end