//
//  KBScrollVoew.h
//  Keyboard_dev
//
//  Created by ming bright on 12-7-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KBScrollViewDelegate;

@interface  KBScrollView : UIScrollView

@property (nonatomic, assign) id <KBScrollViewDelegate> delegate;
@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, readonly) NSUInteger numberOfPages;
@property (nonatomic, assign) BOOL continuous;

- (UIView *)dequeueReusableViewWithTag:(NSInteger)tag;
- (UIView *)viewForPageAtIndex:(NSUInteger)index;
- (void)scrollToPageAtIndex:(NSUInteger)index animated:(BOOL)animated;
- (void)reloadData;
- (NSUInteger)indexForView:(UIView *)view;

@end

@protocol KBScrollViewDelegate <UIScrollViewDelegate>

- (NSUInteger)numberOfPagesInPagedView:(KBScrollView *)pagedView;
- (UIView *)pagedView:(KBScrollView *)pagedView viewForPageAtIndex:(NSUInteger)index;

@optional

- (void)pagedView:(KBScrollView *)pagedView didScrollToPageAtIndex:(NSUInteger)index;
- (void)pagedView:(KBScrollView *)pagedView didRecycleView:(UIView *)view;

@end