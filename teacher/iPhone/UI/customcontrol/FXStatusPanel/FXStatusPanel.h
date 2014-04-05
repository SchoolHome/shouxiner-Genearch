//
//  FXStatusView.h
//  iCouple
//
//  Created by lixiaosong on 12-3-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatusPanelItem.h"

@protocol FXStatusPanelDelegate <NSObject>

-(void)ChooseStatus:(NSInteger)status;

@end

@interface FXStatusPanel : UIView<StatusPanelItemDelegate>
{
  
    UIImageView *background;
    
    id <FXStatusPanelDelegate> delegate;
}
@property (strong,nonatomic) id <FXStatusPanelDelegate> delegate;



- (id)initWithFrame:(CGRect)frame withArray:(NSArray *)array;


@end
