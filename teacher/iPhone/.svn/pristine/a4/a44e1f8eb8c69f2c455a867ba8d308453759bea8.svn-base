//
//  KBPageControl.m
//  Keyboard_dev
//
//  Created by ming bright on 12-7-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KBPageControl.h"

// 点之间的距离
#define kDotDistence 12  


@implementation KBPageControl
@synthesize numberOfPages = _numberOfPages;
@synthesize currentPage = _currentPage;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _hidesForSinglePage = NO;
        
    }
    return self;
}


-(void)setNumberOfPages:(NSInteger)numberOfPages_{
    _numberOfPages = numberOfPages_;
    [self setNeedsDisplay];
}

-(void)setCurrentPage:(NSInteger)currentPage_{
    _currentPage = currentPage_;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIImage *white = [UIImage imageNamed:@"icon_im_point_whtie"];
    UIImage *gray = [UIImage imageNamed:@"icon_im_point_gray"];
    
    [super drawRect:rect];

    if (_numberOfPages <=1) {  // 只有一页,不显示
        // 
        if (!_hidesForSinglePage) {
            [white drawInRect:CGRectMake((rect.size.width - 7)/2, (rect.size.height - 7)/2, 7, 7)];
        }
        
    }else {  //icon_im_point_whtie   icon_im_point_gray 7  10

        CGFloat leftPadding = (rect.size.width - _numberOfPages*7 - (_numberOfPages-1)*kDotDistence)/2.0f;
        
        
        for (int i = 0; i<_numberOfPages;i++) {
            if (_currentPage == i) {
                [white drawInRect:CGRectMake(leftPadding + (kDotDistence+7)*i, (rect.size.height - 7)/2, 7, 7)];
            }else {
                [gray drawInRect:CGRectMake(leftPadding + (kDotDistence+7)*i, (rect.size.height - 7)/2, 7, 7)];

            }

        }
    }

}

@end
