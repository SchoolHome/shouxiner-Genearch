//
//  BBMessageGroupBaseTableView.h
//  teacher
//
//  Created by ZhangQing on 14-3-17.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BBMessageGroupBaseTableViewDelegate <NSObject>
@optional
-(void)tableviewHadTapped;
@end
@interface BBMessageGroupBaseTableView : UITableView <UIGestureRecognizerDelegate>
@property (nonatomic , assign) id<BBMessageGroupBaseTableViewDelegate> messageGroupBaseTableViewdelegate;
@property (nonatomic) CGPoint beginPotin;
@end
