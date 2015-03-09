//
//  BBFXAdScrollView.m
//  teacher
//
//  Created by mac on 14/11/10.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBFXAdScrollView.h"

@implementation BBFXAdScrollView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        adScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [adScroll setDelegate:(id<UIScrollViewDelegate>)self];
        [adScroll setShowsHorizontalScrollIndicator:NO];
        [adScroll setPagingEnabled:YES];
        [self addSubview:adScroll];
        
        pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, frame.size.height-25, frame.size.width, 20)];
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

-(void)setAdsArray:(NSArray *)adsArray
{
    for (EGOImageView *egoImgv in [adScroll subviews]) {
        [egoImgv removeFromSuperview];
    }
    _adsArray = adsArray;
    NSInteger count = [self.adsArray count];
    [pageControl setNumberOfPages:count];
    [adScroll setContentSize:CGSizeMake(adScroll.frame.size.width*count, adScroll.frame.size.height)];
    for (int i=0; i<count; i++) {
        BBFXModel *model = [self.adsArray objectAtIndex:i];
        EGOImageView *egoAdView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@""]];
        [egoAdView setFrame:CGRectMake(adScroll.frame.size.width*i, 0, adScroll.frame.size.width, adScroll.frame.size.height)];
        [egoAdView setTag:i];
        [egoAdView setImageURL:[NSURL URLWithString:model.image]];
        [egoAdView setUserInteractionEnabled:YES];
        [adScroll addSubview:egoAdView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEgoAdView:)];
        [egoAdView addGestureRecognizer:tap];
    }
}

-(void)tapEgoAdView:(UITapGestureRecognizer *)tap
{
    EGOImageView *egoAdView = (EGOImageView *)tap.view;
    NSInteger tag = egoAdView.tag;
    BBFXModel *model = [self.adsArray objectAtIndex:tag];
    if (_delegate && [self.delegate respondsToSelector:@selector(adViewTapped:)]) {
        [self.delegate performSelector:@selector(adViewTapped:) withObject:model];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self setTimerPose];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self restartTimer];
}

-(void)scrollToNextPage:(id)sender
{
    int pageNum = pageControl.currentPage;
    CGSize viewSize = adScroll.frame.size;
    pageNum++;
    if (pageNum == self.adsArray.count) {
        pageNum = 0;
    }
    CGRect newRect=CGRectMake(pageNum*viewSize.width, 0, viewSize.width, viewSize.height);
    [adScroll scrollRectToVisible:newRect animated:YES];
}

- (void)changePage:(UIPageControl *)sender
{
     int page = pageControl.currentPage;
    CGRect frame = adScroll.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [adScroll scrollRectToVisible:frame animated:YES];
}

-(void)setTimerPose
{
    [pageTimer invalidate];
    pageTimer = nil;
}

-(void)restartTimer
{
    pageTimer = [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(scrollToNextPage:) userInfo:nil repeats:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
