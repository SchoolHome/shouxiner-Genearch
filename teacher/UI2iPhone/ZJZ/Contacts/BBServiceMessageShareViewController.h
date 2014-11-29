//
//  BBServiceMessageShareViewController.h
//  teacher
//
//  Created by ZhangQing on 14/11/26.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "PalmViewController.h"
#import "UIPlaceHolderTextView.h"

#import "BBGroupModel.h"
#import "BBServiceMessageDetailModel.h"
@protocol BBServiceMessageShareTableviewTouchDelegate <NSObject>

- (void)tableviewTouched;

@end

@interface BBServiceMessageShareViewController : PalmViewController<BBServiceMessageShareTableviewTouchDelegate>
- (id)initWithModel:(BBServiceMessageDetailModel *)model;
@end

@interface BBServiceMessageShareTableview : UITableView <UIGestureRecognizerDelegate>

@property (nonatomic, weak) id<BBServiceMessageShareTableviewTouchDelegate> touchDelegate;
@end