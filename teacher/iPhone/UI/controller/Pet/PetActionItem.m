//
//  PetActionItem.m
//  Pet_component_dev
//
//  Created by ming bright on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PetActionItem.h"
#import <QuartzCore/QuartzCore.h>
#import "CPUIModelPetConst.h"
#import "ColorUtil.h"
@implementation PetActionItem
@synthesize  delegate;
@synthesize itemType;

@synthesize frontNormalImage;
@synthesize frontHighlightedImage;
@synthesize backNormalImage;
@synthesize backHighlightedImage;

@synthesize downloadMark;
@synthesize isDownloaded;
@synthesize downloadStatus;
@synthesize canFlip;

@synthesize resourceID;
@synthesize senderDesc;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        
        self.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        [self setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        
        frontImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];

        [self addSubview:backImageView];
        [self addSubview:frontImageView];
        
        
        downloadMark = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 12)/2, frame.size.height- 10-4.5, 12, 10)];
        downloadMark.image = [UIImage imageNamed:@"pet_cq_circledownload"];
        [self addSubview:downloadMark];
        
        
        backImageView.hidden = YES;
        frontImageView.hidden = YES;
        
        [self addTarget:self action:@selector(buttonTaped:) forControlEvents:UIControlEventTouchUpInside];
        
        
        isFront = YES;
        
        self.canFlip = NO;
        
        self.isDownloaded = YES;
        
    }
    return self;
}

-(void)setIsDownloaded:(BOOL)isDownloaded_{
    
    isDownloaded = isDownloaded_;
    
    for (UIView *aView in [self subviews]) {
        if ([aView isKindOfClass:[UIActivityIndicatorView class]]) {
            [aView removeFromSuperview];
        }
    } 
    
    if (isDownloaded) {
        downloadMark.hidden = YES;
        [self setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    }else {
        downloadMark.hidden = NO;
        [self setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    }
}


-(void)setDownloadStatus:(int)downloadStatus_{
    
    downloadStatus = downloadStatus_;
    
    //self.downloadMark.hidden = YES;
    
    if (K_PETRES_DOWNLOD_STATUS_DOWNLOADING == downloadStatus) {  //正在下载
        
        self.downloadMark.hidden = YES;
        
        //
        for (UIView *aView in [self subviews]) {
            if ([aView isKindOfClass:[UIActivityIndicatorView class]]) {
                [aView removeFromSuperview];
            }
        }   
        
        UIActivityIndicatorView  *activ = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activ.frame = CGRectMake((self.frame.size.width - 12)/2, self.frame.size.height- 15, 12, 12);
        activ.transform = CGAffineTransformScale(activ.transform,0.5, 0.5);
        activ.color = [UIColor blackColor];
        [self addSubview:activ];
        [activ startAnimating];
        
        if(self.isDownloaded){
            for (UIView *aView in [self subviews]) {
                if ([aView isKindOfClass:[UIActivityIndicatorView class]]) {
                    [aView removeFromSuperview];
                }
            }  
        }
    }
}

-(void)setCanFlip:(BOOL)flip{
    
    canFlip = flip;
    if (!canFlip) {
        frontImageView.hidden = YES;
        backImageView.hidden = YES;
    }else {
        frontImageView.hidden = NO;
        backImageView.hidden = NO;
    }
}

-(void)setImages{
    
    if (isFront) {
        [self setBackgroundImage:self.frontNormalImage forState:UIControlStateNormal];
        [self setBackgroundImage:self.frontHighlightedImage forState:UIControlStateHighlighted];
    }else {
        [self setBackgroundImage:self.backNormalImage forState:UIControlStateNormal];
        [self setBackgroundImage:self.backHighlightedImage forState:UIControlStateHighlighted];
    }
}

-(void)setFrontNormalImage:(UIImage *)image1 
     frontHighlightedImage:(UIImage *)image2 
           backNormalImage:(UIImage *)image3
      backHighlightedImage:(UIImage *)image4{
    
    
    self.frontNormalImage = image1;
    self.frontHighlightedImage = image2;
    self.backNormalImage = image3;
    self.backHighlightedImage = image4;
    
    [self setFrontImage:image1 backImage:image3];
    
    [self setImages];
}

-(void)buttonTaped:(id)sender{
    if (canFlip) {
        [self flip];
    }
    
//    if (!isDownloaded) {
//        CPLogInfo(@"download");
//        
//        self.downloadMark.hidden = YES;
//    
//        for (UIView *aView in [self subviews]) {
//            if ([aView isKindOfClass:[UIActivityIndicatorView class]]) {
//                [aView removeFromSuperview];
//            }
//        }   
//        
//        UIActivityIndicatorView  *activ = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//        activ.frame = CGRectMake((self.frame.size.width - 12)/2, self.frame.size.height- 15, 12, 12);
//        activ.transform = CGAffineTransformScale(activ.transform,0.5, 0.5);
//        activ.color = [UIColor blackColor];
//        [self addSubview:activ];
//        [activ startAnimating];
//    }
    
    if ([delegate respondsToSelector:@selector(itemTaped:)]) {
        [delegate itemTaped:self];
    }
}

-(void)setFrontImage:(UIImage *)image1 backImage:(UIImage *)image2{
    frontImageView.image = image1;
    backImageView.image = image2;
}

- (void)flip{
    
    frontImageView.hidden = NO;
    backImageView.hidden = NO;
    
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(flipStop)];
    
    [UIView setAnimationTransition: UIViewAnimationTransitionFlipFromRight forView:self cache:YES];
    
    int index1 = [[self subviews] indexOfObject:frontImageView];
    int index2 = [[self subviews] indexOfObject:backImageView];
    
	[self exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
	[UIView commitAnimations];
    
}

- (void)dismiss{
    self.hidden = NO;
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(dismissStop)];
    self.transform = CGAffineTransformScale(self.transform,0.01, 0.01);
	[UIView commitAnimations];

}

- (void)show{
    self.hidden = NO;
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.2];
    [UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(showStop)];
    self.transform = CGAffineTransformIdentity;
	[UIView commitAnimations];
}

-(void)dismissStop{
    self.alpha = 1.0f;
    self.hidden = YES;
}

-(void)showStop{
    //
}

-(void)flipStop{
    //

    isFront = !isFront;
    [self setImages];

    
    frontImageView.hidden = YES;
    backImageView.hidden = YES;
    
}

@end
