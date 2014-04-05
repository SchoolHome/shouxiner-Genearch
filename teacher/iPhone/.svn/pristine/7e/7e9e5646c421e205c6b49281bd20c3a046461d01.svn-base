//
//  StatusPanelItem.h
//  iCouple
//
//  Created by 振杰 李 on 12-3-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FanxerHeader.h"

@protocol StatusPanelItemDelegate <NSObject>

-(void)doChooseStatus:(NSInteger)status;

@end

@interface StatusPanelItem : UIControl {
    
    UIButton *button;
    
    UILabel *label;
    
    id<StatusPanelItemDelegate> delegate;
    
    
}



@property (strong,nonatomic)id <StatusPanelItemDelegate> delegate;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title img:(UIImage *)img;

- (void)DoClick;

@end
