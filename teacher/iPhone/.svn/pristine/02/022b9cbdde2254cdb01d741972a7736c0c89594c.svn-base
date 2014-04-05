//
//  AnimImageView.h
//  Ting_dev
//
//  Created by ming bright on 12-5-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPUIModelManagement.h"
#import "CPUIModelAnimSlideInfo.h"

@protocol AnimImageViewDelegate;

@interface AnimImageView : UIImageView
{
    NSString *name;
    NSArray *animSlideInfoArray;
    int count;
    
    BOOL flag;
}

@property (nonatomic,strong) NSArray *animSlideInfoArray;
@property (nonatomic,assign) id<AnimImageViewDelegate> delegate;
@property (nonatomic,strong) NSString *name;


-(void)addAnimArray:(NSArray *)array forName:(NSString *)nm;

-(void)start;
-(void)pause;
-(void)goOn;
-(void)stop;

@end

@protocol AnimImageViewDelegate <NSObject>

-(void)animImageViewDidStartAnim:(AnimImageView*) animView;
-(void)animImageViewDidStopAnim:(AnimImageView*) animView;

@end
