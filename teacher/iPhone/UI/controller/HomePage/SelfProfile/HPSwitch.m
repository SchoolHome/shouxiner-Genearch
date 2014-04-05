////
////  HPSwitch.m
////  HomePageSelfProfileViewController
////
////  Created by ming bright on 12-5-24.
////  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
////
//
//#import "HPSwitch.h"
//#import "ColorUtil.h"
//
//@implementation HPSwitch
//
//@synthesize on;
//@synthesize  clippingView, leftLabel, rightLabel;
//
//+(HPSwitch *)switchWithLeftText:(NSString *)leftText andRight:(NSString *)rightText
//{
//	HPSwitch *switchView = [[HPSwitch alloc] initWithFrame:CGRectZero];
//	
//	switchView.leftLabel.text = leftText;
//	switchView.rightLabel.text = rightText;
//	
//	//return [switchView autorelease];
//    return switchView;
//}
//
//-(id)initWithFrame:(CGRect)rect
//{
//	if ((self=[super initWithFrame:CGRectMake(rect.origin.x,rect.origin.y,95,27)]))
//	{
//		//		self.clipsToBounds = YES;
//		
//		[self awakeFromNib];
//	}
//	return self;
//}
//
//-(void)awakeFromNib
//{
//	[super awakeFromNib];
//	
//	self.backgroundColor = [UIColor clearColor];
//    
//	[self setThumbImage:[UIImage imageNamed:@"btn_hidecircle_im.png"] forState:UIControlStateNormal];
//	[self setMinimumTrackImage:[UIImage imageNamed:@"btn_hidepiece_im.png"] forState:UIControlStateNormal];
//	[self setMaximumTrackImage:[UIImage imageNamed:@"btn_hidepiece_im.png"] forState:UIControlStateNormal];
//	
//	self.minimumValue = 0;
//	self.maximumValue = 1;
//	self.continuous = NO;
//	
//	self.on = NO;
//	self.value = 0.0;
//	
//	self.clippingView = [[UIView alloc] initWithFrame:CGRectMake(4,2,87,23)];
//	self.clippingView.clipsToBounds = YES;
//	self.clippingView.userInteractionEnabled = NO;
//	self.clippingView.backgroundColor = [UIColor clearColor];
//	[self addSubview:self.clippingView];
//	
//	NSString *leftLabelText = @"  隐藏宝宝";
//	self.leftLabel = [[UILabel alloc] init];
//	self.leftLabel.frame = CGRectMake(0, 0, 48, 23);
//	self.leftLabel.text = leftLabelText;
//	self.leftLabel.textAlignment = UITextAlignmentCenter;
//	self.leftLabel.font = [UIFont systemFontOfSize:11];
//	self.leftLabel.textColor = [UIColor colorWithHexString:@"#666666"];
//	self.leftLabel.backgroundColor = [UIColor clearColor];
//	[self.clippingView addSubview:self.leftLabel];
//
//	
//	NSString *rightLabelText = @"显示宝宝  ";
//	self.rightLabel = [[UILabel alloc] init];
//	self.rightLabel.frame = CGRectMake(95, 0, 48, 23);
//	self.rightLabel.text = rightLabelText;
//	self.rightLabel.textAlignment = UITextAlignmentCenter;
//	self.rightLabel.font = [UIFont systemFontOfSize:11];
//	self.rightLabel.textColor = [UIColor colorWithHexString:@"#999999"];
//	self.rightLabel.backgroundColor = [UIColor clearColor];
//
//	[self.clippingView addSubview:self.rightLabel];
//
//	
//	
//}
//
//-(void)layoutSubviews
//{
//	[super layoutSubviews];
//
//	[self.clippingView removeFromSuperview];
//	[self addSubview:self.clippingView];
//	
//	CGFloat thumbWidth = self.currentThumbImage.size.width;
//	CGFloat switchWidth = self.bounds.size.width;
//	CGFloat labelWidth = switchWidth - thumbWidth;
//	CGFloat inset = self.clippingView.frame.origin.x;
//
//	NSInteger xPos = self.value * labelWidth - labelWidth - inset;
//	self.leftLabel.frame = CGRectMake(xPos, 0, labelWidth, 23);
//	
//	xPos = switchWidth + (self.value * labelWidth - labelWidth) - inset; 
//	self.rightLabel.frame = CGRectMake(xPos, 0, labelWidth, 23);
//	
//}
//
//
//- (void)setOn:(BOOL)turnOn animated:(BOOL)animated;
//{
//	on = turnOn;
//	
//	if (animated)
//	{
//		[UIView	 beginAnimations:@"HPSwitch" context:nil];
//		[UIView setAnimationDuration:0.2];
//	}
//	
//	if (on)
//	{
//		self.value = 1.0;
//	}
//	else 
//	{
//		self.value = 0.0;
//	}
//	
//	if (animated)
//	{
//		[UIView	commitAnimations];	
//	}
//}
//
//- (void)setOn:(BOOL)turnOn
//{
//	[self setOn:turnOn animated:NO];
//}
//
//
//- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
//{
//
//    
//	[self setOn:on animated:YES];
//    
//    [self sendActionsForControlEvents:UIControlEventValueChanged];
//	[self sendActionsForControlEvents:UIControlEventTouchUpInside];
//    [self setThumbImage:[UIImage imageNamed:@"btn_hidecircle_im.png"] forState:UIControlStateNormal];
//}
//
//
//- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
//{
//    
//    on = !on;
//    
//    [self setThumbImage:[UIImage imageNamed:@"btn_hidecirclepress_im.png"] forState:UIControlStateNormal];
//    
//	[self sendActionsForControlEvents:UIControlEventTouchDown];
//	return YES;
//}
//
//
//- (void)cancelTrackingWithEvent:(UIEvent *)event
//{
//    [self sendActionsForControlEvents:UIControlEventValueChanged];
//	[self sendActionsForControlEvents:UIControlEventTouchUpInside];
//    [self setThumbImage:[UIImage imageNamed:@"btn_hidecircle_im.png"] forState:UIControlStateNormal];
//    
//}
//
//
//
//@end

//
//  HPSwitch.m
//  HomePageSelfProfileViewController
//
//  Created by ming bright on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HPSwitch.h"
#import "ColorUtil.h"

@implementation HPSwitch

@synthesize on;
@synthesize  clippingView, leftLabel, rightLabel;

+(HPSwitch *)switchWithLeftText:(NSString *)leftText andRight:(NSString *)rightText
{
	HPSwitch *switchView = [[HPSwitch alloc] initWithFrame:CGRectZero];
	
	switchView.leftLabel.text = leftText;
	switchView.rightLabel.text = rightText;
	
	//return [switchView autorelease];
    return switchView;
}

-(id)initWithFrame:(CGRect)rect
{
	if ((self=[super initWithFrame:CGRectMake(rect.origin.x,rect.origin.y,rect.size.width,rect.size.height)]))
	{
		//		self.clipsToBounds = YES;
		
		[self awakeFromNib];
	}
	return self;
}

-(void)awakeFromNib
{
	[super awakeFromNib];
	
	self.backgroundColor = [UIColor clearColor];
    
	[self setThumbImage:[UIImage imageNamed:@"btn_hidecircle_im.png"] forState:UIControlStateNormal];
    
    UIImage *image = [UIImage imageNamed:@"btn_hidepiece_im.png"];
    image = [image stretchableImageWithLeftCapWidth:10 topCapHeight:0];
    
    UIImage *image1 = [UIImage imageNamed:@"btn_hidepiece_im02.png"];
    image1 = [image1 stretchableImageWithLeftCapWidth:10 topCapHeight:0];
    
	[self setMinimumTrackImage:image forState:UIControlStateNormal];
	[self setMaximumTrackImage:image1 forState:UIControlStateNormal];
	
	self.minimumValue = 0;
	self.maximumValue = 1;
	self.continuous = NO;
	
	self.on = NO;
	self.value = 0.0;
	
	self.clippingView = [[UIView alloc] initWithFrame:CGRectMake(4,0,self.frame.size.width-8,self.frame.size.height)];
	self.clippingView.clipsToBounds = YES;
	self.clippingView.userInteractionEnabled = NO;
	self.clippingView.backgroundColor = [UIColor clearColor];
	[self addSubview:self.clippingView];
	
	NSString *leftLabelText = @"神秘";
	self.leftLabel = [[UILabel alloc] init];
	self.leftLabel.frame = CGRectMake(4, 0, self.frame.size.width-32, self.frame.size.height);
	self.leftLabel.text = leftLabelText;
	self.leftLabel.textAlignment = UITextAlignmentRight;
	self.leftLabel.font = [UIFont systemFontOfSize:12];
	self.leftLabel.textColor = [UIColor whiteColor];
	self.leftLabel.backgroundColor = [UIColor clearColor];
	[self.clippingView addSubview:self.leftLabel];
    
	
	NSString *rightLabelText = @"普通";
	self.rightLabel = [[UILabel alloc] init];
	self.rightLabel.frame = CGRectMake(self.frame.size.width-4, 0, self.frame.size.width-32, self.frame.size.height);
	self.rightLabel.text = rightLabelText;
	self.rightLabel.textAlignment = UITextAlignmentLeft;
	self.rightLabel.font = [UIFont systemFontOfSize:12];
	self.rightLabel.textColor = [UIColor colorWithHexString:@"#CCCCCC"];
	self.rightLabel.backgroundColor = [UIColor clearColor];
    
	[self.clippingView addSubview:self.rightLabel];
    
	
	
}

-(void)layoutSubviews
{
	[super layoutSubviews];
    
	[self.clippingView removeFromSuperview];
	[self addSubview:self.clippingView];
	
	CGFloat thumbWidth = self.currentThumbImage.size.width;
	CGFloat switchWidth = self.bounds.size.width;
	CGFloat labelWidth = switchWidth - thumbWidth;
	CGFloat inset = self.clippingView.frame.origin.x;
    
	NSInteger xPos = self.value * labelWidth - labelWidth - inset;
	self.leftLabel.frame = CGRectMake(xPos, 0, labelWidth, self.frame.size.height);
	
	xPos = switchWidth + (self.value * labelWidth - labelWidth) - inset; 
	self.rightLabel.frame = CGRectMake(xPos, 0, labelWidth, self.frame.size.height);
	
}


- (void)setOn:(BOOL)turnOn animated:(BOOL)animated;
{
	on = turnOn;
	
	if (animated)
	{
		[UIView	 beginAnimations:@"HPSwitch" context:nil];
		[UIView setAnimationDuration:0.2];
	}
	
	if (on)
	{
		self.value = 1.0;
	}
	else 
	{
		self.value = 0.0;
	}
	
	if (animated)
	{
		[UIView	commitAnimations];	
	}
}

- (void)setOn:(BOOL)turnOn
{
	[self setOn:turnOn animated:NO];
}


- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    
	[self setOn:on animated:YES];
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
	[self sendActionsForControlEvents:UIControlEventTouchUpInside];
    //[self setThumbImage:[UIImage imageNamed:@"btn_hidecircle_im.png"] forState:UIControlStateNormal];
}


- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    on = !on;
    
    //[self setThumbImage:[UIImage imageNamed:@"btn_hidecirclepress_im.png"] forState:UIControlStateNormal];
    
	[self sendActionsForControlEvents:UIControlEventTouchDown];
	return YES;
}


- (void)cancelTrackingWithEvent:(UIEvent *)event
{
    [self sendActionsForControlEvents:UIControlEventValueChanged];
	[self sendActionsForControlEvents:UIControlEventTouchUpInside];
    //[self setThumbImage:[UIImage imageNamed:@"btn_hidecircle_im.png"] forState:UIControlStateNormal];
    
}



@end
