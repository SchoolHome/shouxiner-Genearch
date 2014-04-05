//
//  CBlockView.m
//  TestLoading
//
//  Created by lixiaosong on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//



#import "CBlockView.h"
#import "CBlockViewConfig.h"
#import "TBundleOperator.h"
@interface CBlockView(private)

@end

@implementation CBlockView
- (id)init{
    self = [super init];
    if(self){
        [self doInitConfig];
        [self doInitComponent];
    }
    return self;
}


- (void)doInitConfig{
    bundleOperator = [TBundleOperator sharedInstance];
}
- (void)doInitComponent{
    
    groundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [groundView setBackgroundColor:[UIColor clearColor]];
    
    
    blockView = [[UIView alloc] initWithFrame:CGRectMake(BLOCK_VIEW_X, BLOCK_VIEW_Y, BLOCK_VIEW_W, BLOCK_VIEW_H)];
    [blockView setBackgroundColor:[UIColor blackColor]];
    [blockView setAlpha:0.8]; 
    blockView.layer.cornerRadius = 15;
    blockView.layer.masksToBounds = YES;
    
    textView = [[UITextView alloc] initWithFrame:CGRectMake(TEXT_VIEW_X, TEXT_VIEW_Y, TEXT_VIEW_W, TEXT_VIEW_H)];
    [textView setEditable:NO];
    [textView setUserInteractionEnabled:NO];
    [textView setFont:[UIFont systemFontOfSize:16]];
    [textView setBackgroundColor:[UIColor clearColor]];
    [textView setTextColor:[UIColor whiteColor]];
    
    closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage * closeNormalImage = [bundleOperator doGetImageFromImageNormalBundleWithFileName:@"btn_on_close@2x.png"];
    UIImage * closeHighlightImage = [bundleOperator doGetImageFromImageNormalBundleWithFileName:@"btn_on_close_hover@2x.png"];
    CGSize imageSize = closeNormalImage.size;
    [closeButton setImage:closeNormalImage forState: UIControlStateNormal];
    [closeButton setImage:closeHighlightImage forState: UIControlStateHighlighted];
    [closeButton setFrame:CGRectMake(CLOSE_BUTTON_X, CLOSE_BUTTON_Y, imageSize.width, imageSize.height)];
    [closeButton addTarget:self action:@selector(doRespondToCloseButtonTouched) forControlEvents:UIControlEventTouchUpInside];

    [groundView addSubview:blockView];
    [groundView addSubview:textView];
    [groundView addSubview:closeButton];

}


- (void)doShowBlockViewInView:(UIView *)view{
    [view addSubview:groundView];
    
}
- (void)doShowBlockViewInViewController:(UIView *)viewController{
    [viewController addSubview:groundView];
}
- (void)doHideBlockView{
     [groundView removeFromSuperview];
}
- (void)doRespondToCloseButtonTouched{
    [self doHideBlockView];
}

- (void)doSetText:(NSString *)textString{
    [textView setText:textString];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    NSString *string = @"Hello World!";
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetShadow(context, CGSizeMake(20.0f, 20.0f), 10.0f);
    
 CGContextRef context = UIGraphicsGetCurrentContext();
 CGContextSelectFont(context, "Arial", 20, kCGEncodingMacRoman);
 CGContextSetTextDrawingMode(context, kCGTextFill);
 CGAffineTransform transform = CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0);
 CGContextSetTextMatrix(context, transform);
 CGContextSetTextPosition(context, x, y+20);
 CGContextShowText(context, [text  UTF8String], strlen([text UTF8String]));   
 [string drawAtPoint:CGPointMake(100.0f, 100.0f) withFont:[UIFont boldSystemFontOfSize:36.0f]];
}
*/
/* If defined, called by the default implementation of the -display
 * method, in which case it should implement the entire display
 * process (typically by setting the `contents' property). */



/* Called by the default -layoutSublayers implementation before the layout
 * manager is checked. Note that if the delegate method is invoked, the
 * layout manager will be ignored. */


@end
