//
//  BBFXServiceView.h
//  teacher
//
//  Created by mac on 15/3/5.
//  Copyright (c) 2015年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBFXGridView.h"
@protocol BBFXServiceViewDelegate <NSObject>
-(void)tapOneFXService:(BBFXGridView *)gridView;
@end

@interface BBFXServiceView : UIView
{
    UIScrollView *svcScroll;
    UIPageControl *pageControl;
}
@property (nonatomic, weak) id<BBFXServiceViewDelegate>delegate;
-(void)setServiceArray:(NSArray *)svcArray;
@end
