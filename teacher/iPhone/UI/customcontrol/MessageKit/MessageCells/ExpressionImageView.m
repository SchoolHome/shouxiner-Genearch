//
//  ExpressionImageView.m
//  Components_xxx
//
//  Created by ming bright on 12-5-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ExpressionImageView.h"
#import "CPUIModelManagement.h"
#import "CPUIModelPetSmallAnim.h"
#import "CPUIModelAnimSlideInfo.h"
#define kDefaultAnimationImageCount 16



@interface ExpressionImageView ()
- (void)prepareAnimation;
@end


@implementation ExpressionImageView
@synthesize expression;
@synthesize defaultImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame expression:(NSString *)exp{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        self.expression = exp;
        [self prepareAnimation];
        
        if ([self.animationImages count]>0) {
			self.image = [self.animationImages objectAtIndex:0];
		}
    }
    
    return self;
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self isAnimating]) {
        [self stopAnimating];
        [self setDefaultImage:[self.animationImages objectAtIndex:0]];
    }else {
        if ([self.animationImages count]>1){
            [self startAnimating];
        }
        
    }

}

- (void)prepareAnimation{	

    CPUIModelPetSmallAnim *anim = [[CPUIModelManagement sharedInstance] smallAnimObectOfEscapeChar:self.expression];
    
    if (anim) {
        [self setDefaultImage:anim.defaultImg];
        
        NSArray *slides = [anim allAnimSlides];
        
        CGFloat duration = 0.05f;
        
        if ([slides count]>0) {
            CPUIModelAnimSlideInfo *info = [[anim allAnimSlides] objectAtIndex:0];
            duration = [info.duration floatValue]/1000.0f;
        }
        
        self.animationImages = [anim animImgArray];
        self.animationDuration = [[anim allAnimSlides] count]*duration;
        self.animationRepeatCount = 0;
    }else {   //表情不存在
        //[self setDefaultImage:[UIImage imageNamed:@""]];
    }
    

}



- (void)setDefaultImage:(UIImage *)defImage{
    self.image = defImage;
}


- (void)willMoveToSuperview:(UIView *)newSuperview{
	[super willMoveToSuperview:newSuperview];
	if ([self.animationImages count]>1) {
		//[self startAnimating];
	}
}

- (void)removeFromSuperview{
	[super removeFromSuperview];
//	if ([self.animationImages count]>1) {
//		[self stopAnimating];
//	}
}

@end
