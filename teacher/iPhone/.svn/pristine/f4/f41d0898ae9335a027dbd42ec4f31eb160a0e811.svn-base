//
//  HomePageAnimView.m
//  MainPage_dev
//
//  Created by ming bright on 12-5-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomePageAnimView.h"

#define kMoveDistanceX  40
#define kMoveDistanceY  40

// 1,背景淡出 不动
// 2,前景淡入 移动  每次都重新创建新的前景，开始是透明的

@implementation HomePageAnimView
@synthesize images;
@synthesize isRunning;

@synthesize front;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        random = 0;
        self.isRunning = NO;
        backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-40, -60, 320+80, 480+120)];
        [self addSubview:backImageView];
        backImageView.layer.opacity = 0;
        
        UIImageView *frontImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-40, -60, 320+80, 480+120)];
        frontImageView.layer.opacity = 1;
        self.front = frontImageView;
        [self addSubview:self.front];
        frontImageView = nil;
        
        opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.toValue  = [NSNumber numberWithFloat:0.0f];
        opacityAnimation.duration = 3.5f;
        opacityAnimation.removedOnCompletion= NO;
        opacityAnimation.fillMode = kCAFillModeForwards;
        
        opacityAnimation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation1.toValue  = [NSNumber numberWithFloat:1.0f];
        opacityAnimation1.duration = 2.5;
        opacityAnimation1.removedOnCompletion= NO;
        opacityAnimation1.fillMode = kCAFillModeForwards;
        
        animRecords = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)setImages:(NSMutableArray *)images_{
    images = images_;
    backImageView.image = [UIImage imageNamed:[[images objectAtIndex:[images count]-1] valueForKey:kImageName]];
    self.front.image = [UIImage imageNamed:[[images objectAtIndex:0] valueForKey:kImageName]];
    
    [self stop];
}

-(void)changePage{
    
    [backImageView.layer removeAllAnimations];
    
    int rd = 0;
    do{
        rd = arc4random()%[images count];
    }while (random == rd||[animRecords containsObject:[NSNumber numberWithInt:rd]]);  //去掉重复
    
    random = rd;
    
    
    if ([animRecords count]<[images count]-2) {
        [animRecords addObject:[NSNumber numberWithInt:random]];
    }else {
        [animRecords addObject:[NSNumber numberWithInt:random]];
        [animRecords removeObjectAtIndex:0];
    }
    
    backImageView.image = front.image;
    backImageView.layer.opacity = 1;
    
    UIImageView *frontImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-40, -60, 320+80, 480+120)];
    frontImageView.layer.opacity = 0;
    self.front = frontImageView;
    [self addSubview:self.front];
    frontImageView = nil;
    
    front.image = [UIImage imageNamed:[[images objectAtIndex:random] valueForKey:kImageName]];//backImageView.image;

    [backImageView.layer addAnimation:opacityAnimation forKey:@"opacityDown"];
    [front.layer addAnimation:opacityAnimation1 forKey:@"opacityUp"];
    
    [UIView beginAnimations:@"translation" context:nil];
    [UIView setAnimationDuration:5.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(stopViewAnim)];

    int type = [[[images objectAtIndex:random] valueForKey:kAnimType] intValue];
    
    switch (type) {
        case HP_ANIMI_TYPE_LEFT2RIGHT:
            //
        {
            front.layer.transform = CATransform3DMakeTranslation(kMoveDistanceX,0,0);
        }
            break;
            
        case HP_ANIMI_TYPE_RIGHT2LEFT:
            //
        {
            front.layer.transform = CATransform3DMakeTranslation(-kMoveDistanceX,0,0);
        }
            break;
            
        case HP_ANIMI_TYPE_LEFT2RIGHT_UP:
            //
        {
            front.layer.transform = CATransform3DMakeTranslation(kMoveDistanceX,-kMoveDistanceY,0);
        }
            break;
            
        case HP_ANIMI_TYPE_LEFT2RIGHT_DOWN:
            //
        {
            front.layer.transform = CATransform3DMakeTranslation(kMoveDistanceX,kMoveDistanceY,0);
        }
            break;
            
        case HP_ANIMI_TYPE_RIGHT2LEFT_UP:
            //
        {
            front.layer.transform = CATransform3DMakeTranslation(-kMoveDistanceX,-kMoveDistanceY,0);
        }
            break;
            
        case HP_ANIMI_TYPE_RIGHT2LEFT_DOWN:
            //
        {
            front.layer.transform = CATransform3DMakeTranslation(-kMoveDistanceX,kMoveDistanceY,0);
        }
            break;
            
        case HP_ANIMI_TYPE_UP:
            //
        {
            front.layer.transform = CATransform3DMakeTranslation(0,-kMoveDistanceY,0);
        }
            break;
            
        case HP_ANIMI_TYPE_DOWN:
            //
        {
            front.layer.transform = CATransform3DMakeTranslation(0,kMoveDistanceY,0);
        }
            break;
            
        case HP_ANIMI_TYPE_ZOOM_IN:
            //
        {
            front.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1);

        }
            break;
            
        case HP_ANIMI_TYPE_ZOOM_OUT:
            //
        {
            front.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1);
        }
            break;
            
        default:
            break;
    }
    [UIView commitAnimations];
}

-(void)run{
    
    self.isRunning = YES;
    random = 0;
    
    [animRecords removeAllObjects];
    
    if (!moveTimer) {
        moveTimer = [NSTimer scheduledTimerWithTimeInterval:7.2 target:self selector:@selector(changePage) userInfo:nil repeats:YES];
    }
    [self changePage];

}

-(void)stop{
    
    if (moveTimer) {
        [moveTimer invalidate];
        moveTimer = nil;
    }
    
    [front.layer removeAllAnimations];
    [backImageView.layer removeAllAnimations];
    
    self.isRunning = NO;
}

-(void)hideBackground{
    backImageView.hidden = YES;
}

-(void)showBackground{
    backImageView.hidden = NO;
}

@end



