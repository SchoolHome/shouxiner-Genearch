//
//  AnimImageView.m
//  Ting_dev
//
//  Created by ming bright on 12-5-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AnimImageView.h"

@interface AnimImageView ()
@end

@implementation AnimImageView
@synthesize delegate;
@synthesize animSlideInfoArray;
@synthesize name;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void)addAnimArray:(NSArray *)array forName:(NSString *)nm{
    [self pause];
    count = 0;
    animSlideInfoArray = array;
    name = nm;
    [self goOn];
}

-(void)_didStopAnim{
    if ([self.delegate respondsToSelector:@selector(animImageViewDidStopAnim:)]) {
        [self.delegate animImageViewDidStopAnim:self];
    }
}

-(void)update{
    
    if (flag) {
        int index = count;
        if (index<[self.animSlideInfoArray count]) {
            //NSLog(@"******************begin*************************");
            CPUIModelAnimSlideInfo *info = [self.animSlideInfoArray objectAtIndex:index];
            NSString *path = info.fileName;
            CGFloat  duration = [info.duration floatValue]/1000.0f;
            
            
            NSData *data = [NSData dataWithContentsOfFile:path];
            UIImage *image = [[UIImage alloc] initWithData:data];
            
            //NSLog(@"-------------------------------------------%d",count);
            self.image = image;//[UIImage imageNamed:[self.imagesArray objectAtIndex:index]];
            //NSLog(@"******************end*************************");
            [self performSelector:@selector(update) withObject:nil afterDelay:duration];
        }else {
            CPUIModelAnimSlideInfo *info = [self.animSlideInfoArray lastObject];
            NSString *path = info.fileName;
            //CGFloat  duration = [info.duration floatValue];
            
            NSData *data = [NSData dataWithContentsOfFile:path];
            UIImage *image = [[UIImage alloc] initWithData:data];
            self.image = image;//[UIImage imageNamed:[self.imagesArray lastObject]];
            [self pause];
            //[self performSelector:@selector(_didStopAnim) withObject:nil afterDelay:duration];
            [self _didStopAnim];
        }
        count ++;
    }else {
        //
    }
}

-(void)start{
    count = 0;
    [self goOn];
}

-(void)pause{
     flag = NO;
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(update) object:nil];
}

-(void)goOn{
    
    flag = YES;
    
    if ([self.delegate respondsToSelector:@selector(animImageViewDidStartAnim:)]) {
        [self.delegate animImageViewDidStartAnim:self];
    }
    [self update];
}

-(void)stop{
    
    flag = NO;
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(update) object:nil];
}

@end
