//
//  HPStatusBarTipView.m
//  statusBar_dev
//
//  Created by ming bright on 12-6-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HPStatusBarTipView.h"
#import "ColorUtil.h"
@implementation HPStatusBarTipView
@synthesize delegate;
@synthesize modeMsgGroup = _modeMsgGroup;
static HPStatusBarTipView *_instance = nil;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		
		self.alpha = 0.0f;
		self.windowLevel = UIWindowLevelStatusBar + 1.0f;
		self.frame = [UIApplication sharedApplication].statusBarFrame;
        self.userInteractionEnabled = YES;
		self.backgroundColor = [UIColor clearColor];
        
        baseView = [[UIButton alloc] initWithFrame:CGRectMake(207, 0, 320-207, self.frame.size.height)];
        baseView.backgroundColor = [UIColor blackColor];
        [self addSubview:baseView];

        [baseView addTarget:self action:@selector(beginTaped:) forControlEvents:UIControlEventTouchDown];
        [baseView addTarget:self action:@selector(finishTaped:) forControlEvents:UIControlEventTouchUpInside];
         [baseView addTarget:self action:@selector(finishTaped:) forControlEvents:UIControlEventTouchCancel];
        
		//imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (20-15.5)/2.0, 12, 15.5)];
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (20-14)/2.0, 17.5, 14)];
		imageView.image = [UIImage imageNamed:@"logo_bar"];
		[baseView addSubview:imageView];
        
		
		msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(18+5.5, (20-14)/2.0, 50, 14)];
		msgLabel.backgroundColor = [UIColor clearColor];
		msgLabel.textColor = [UIColor colorWithHexString:@"#999999"];
		msgLabel.font = [UIFont boldSystemFontOfSize:11.0f];
		msgLabel.textAlignment = UITextAlignmentLeft;
		[baseView addSubview:msgLabel];
        
        countLabel = [[UILabel alloc] initWithFrame:CGRectMake(18+5.5, (20-14)/2.0, 50, 14)];
		countLabel.backgroundColor = [UIColor clearColor];
		countLabel.textColor = [UIColor colorWithHexString:@"#999999"];
		countLabel.font = [UIFont boldSystemFontOfSize:11.0f];
		countLabel.textAlignment = UITextAlignmentLeft;
		[baseView addSubview:countLabel];
		
    }
    return self;
}


-(void)showMessage:(NSString *)message msgGroup:(CPUIModelMessageGroup *)group infoCount:(NSInteger)count{
    [self showMessage:message msgGroup:group infoCount:count duration:2.5];
}

-(void)showMessage:(NSString *)message msgGroup:(CPUIModelMessageGroup *)group infoCount:(NSInteger)count duration:(NSTimeInterval)duration{
    msgLabel.text = message;
    [msgLabel sizeToFit];
    
    
    if (count>0&&message) {
        
        self.modeMsgGroup = group;
        
        NSString *countStr;
        if (count>99) {
            countStr = @"(99+)";
        }else {
            countStr = [NSString stringWithFormat:@"(%d)",count];
        }
        countLabel.text = countStr;
        
        if (msgLabel.frame.size.width>55) {
            msgLabel.frame = CGRectMake(18+5.5, (20-14)/2.0, 55, 14);
            countLabel.frame = CGRectMake(55+18+5.5+3, (20-14)/2.0, 30, 14);
        }else {
            countLabel.frame = CGRectMake(msgLabel.frame.size.width+18+5.5+3, (20-14)/2.0, 30, 14);
        }
        
        self.alpha = 0.0f;
        baseView.frame = CGRectMake(207, -20, 320-207, self.frame.size.height);
        
        
        [UIView animateWithDuration:[UIApplication sharedApplication].statusBarOrientationAnimationDuration
                         animations:^{
                             self.alpha = 1.0f;
                             baseView.frame = CGRectMake(207, 0, 320-207, self.frame.size.height);
                         } completion:^(BOOL finished) {
                         }];
    }else {
        // error
        [self dismiss];
    }
    

    
    //[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hide) object:nil];
	//[self performSelector:@selector(hide) withObject:nil afterDelay:duration];
}


-(void)dismiss{
	/*
    [UIView animateWithDuration:[UIApplication sharedApplication].statusBarOrientationAnimationDuration
                     animations:^{
                         self.alpha = 0.0f;
                         baseView.frame = CGRectMake(207, -20, 320-207, self.frame.size.height);
    } completion:^(BOOL finished) {
        msgLabel.text = nil;
        countLabel.text = nil;
    }];
     */
    self.alpha = 0.0f;
    baseView.frame = CGRectMake(207, -20, 320-207, self.frame.size.height);
    msgLabel.text = nil;
    countLabel.text = nil;
    
}


-(void)beginTaped:(id)sender{
    imageView.image = [UIImage imageNamed:@"logo_barpress"];
}

-(void)finishTaped:(id)sender{
    imageView.image = [UIImage imageNamed:@"logo_bar"];
    [self dismiss];
    if ([self.delegate respondsToSelector:@selector(statusBarTipViewTaped:)]) {
        [self.delegate statusBarTipViewTaped:self];
    }
}

+(HPStatusBarTipView *)shareInstance{
	@synchronized(self) {
		if (!_instance) {
			_instance = [[HPStatusBarTipView alloc] initWithFrame:CGRectZero];
		}
	}
	return _instance;
}


+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (!_instance) {
			_instance = [super allocWithZone:zone];
			return _instance;
		}
	}
	return nil;
}

- (id)copyWithZone:(NSZone *)zone {
	return self;
}



@end
