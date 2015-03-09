//
//  BBFXServiceView.m
//  teacher
//
//  Created by mac on 15/3/5.
//  Copyright (c) 2015年 ws. All rights reserved.
//

#import "BBFXServiceView.h"

@implementation BBFXServiceView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        svcScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [svcScroll setBackgroundColor:[UIColor whiteColor]];
        [svcScroll setShowsHorizontalScrollIndicator:NO];
        [svcScroll setDelegate:(id<UIScrollViewDelegate>)self];
        [svcScroll setPagingEnabled:YES];
        [self addSubview:svcScroll];
        
        pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, frame.size.height-10, frame.size.width, 10)];
        [pageControl setHidesForSinglePage:YES];
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) {
            [pageControl setPageIndicatorTintColor:[UIColor colorWithRed:0.888f green:0.888f blue:0.888f alpha:0.8f]];
            [pageControl setCurrentPageIndicatorTintColor:[UIColor colorWithRed:0.988f green:0.404f blue:0.137f alpha:0.8f]];
        }
        [pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:pageControl];
    }
    return self;
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [svcScroll setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
}

-(void)setServiceArray:(NSArray *)svcArray
{
    for (BBFXGridView *subView in [svcScroll subviews]) {
        [subView removeFromSuperview];
    }
    NSInteger count = [svcArray count];
    [svcScroll setContentSize:CGSizeMake((count/8 + 1) * self.frame.size.width, self.frame.size.height)];
    for (int i=0; i<count; i++) {
        NSInteger offset = (i/8) * self.frame.size.width;
        NSInteger height = (i%8) > 3?75:10;
        BBFXGridView *gridView = [[BBFXGridView alloc] init];
        gridView.pageIndex = i / 8;
        gridView.numIndex = i % 8;
        [gridView setFrame:CGRectMake(i%4*(55+20)+offset+20, height, 55, 55)];
        [gridView addTarget:self action:@selector(tapOneGrid:) forControlEvents:UIControlEventTouchUpInside];
        BBFXModel *model = [svcArray objectAtIndex:i];
        [gridView setViewData:model];
        [svcScroll addSubview:gridView];
    }
    [pageControl setNumberOfPages:(count%8==0)?count/8:(count/8+1)];
}

-(void)tapOneGrid:(BBFXGridView *)gridView
{
    if (_delegate && [self.delegate respondsToSelector:@selector(tapOneFXService:)]) {
        [self.delegate tapOneFXService:gridView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
}

- (void)changePage:(UIPageControl *)sender
{
    int page = pageControl.currentPage;
    CGRect frame = svcScroll.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [svcScroll scrollRectToVisible:frame animated:YES];
}
@end
