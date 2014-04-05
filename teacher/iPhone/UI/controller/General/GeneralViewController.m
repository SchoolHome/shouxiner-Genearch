//
//  GeneralViewController.m
//  iCoupleUI
//
//  Created by Eric yang on 3/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GeneralViewController.h"
#import "FanxerIndicatorControl.h"
#import "FXTopTipPanel.h"
#import "FXTopTipPanelDelegate.h"


@interface GeneralViewController(private)
- (void)do_show_loading_view;
@end

@implementation GeneralViewController
@synthesize loading_content_string = _loading_content_string;
@synthesize toptip_string = _toptip_string;

@synthesize loading_interval = _loading_interval;
@synthesize delegate = _delegate , hasOnTimeOut = _hasOnTimeOut;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.toptip_string = @"联网失败，请检查网络！";
        self.loading_interval = 20.0f;
        self.hasOnTimeOut = YES;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark main_view
- (void)do_init_main_view{
    UIView * main_view_temp = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    self.view = main_view_temp;
    main_view_temp = nil;
}
#pragma mark loading_view

- (void)do_init_loading_view{
    self.hasOnTimeOut = YES;
   // fxind =[[FanxerIndicatorControl alloc] initWithFrame:FXRect(200.0/2.0, 181.0/2.0, 239.0/2.0, 175.0/2.0) message:self.loading_content_string title:@"" bgimg:INDICATOR_BG];
    fxind =[[FanxerIndicatorControl alloc] initWithFrame:FXRect(200.0/2.0, 181.0, 239.0/2.0, 175.0/2.0) message:self.loading_content_string title:@"" bgimg:INDICATOR_BG];
    blockview=[[UIView alloc] initWithFrame:FXRect(0.0, 0.0, 320.0, 480.0)];
    [blockview addSubview:fxind];
    blockview.alpha=0.0;
}

- (void)do_show_loading_view_content_string:(NSString *)content_string{
    self.loading_content_string = content_string;
    [self do_init_loading_view];
    [self.view addSubview:blockview];
    blockview.alpha = 1.0;
   // NSLog(@"-------------------------------------------loading_interval:%f",self.loading_interval);
    [self performSelector:@selector(loadingOnTimeOut) withObject:nil afterDelay:self.loading_interval];
}

-(void) loadingOnTimeOut{
    blockview.alpha = 0.0;
    [blockview removeFromSuperview];
    [self do_destory_loading_view];
    
    //if (self.hasOnTimeOut) {
        if ([self.delegate respondsToSelector:@selector(onTimeOut)]) {
            [self.delegate onTimeOut];
        }
    //}
}

- (void)do_hide_loading_view{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    //self.hasOnTimeOut = NO;
    blockview.alpha = 0.0;
    [blockview removeFromSuperview];
    [self do_destory_loading_view];
}

- (void)do_destory_loading_view{
    blockview = nil;
    fxind = nil;
}
#pragma mark TopTipView
- (void)do_init_toptip_view{
    if(toptippanel == nil){
        toptippanel=[[FXTopTipPanel alloc] initWithFrame:FXRect(35.0, -66.0, 250, 46) message:self.toptip_string]; 
    }
    else{
        [toptippanel.messagelabel setText:self.toptip_string];
    }
}

- (void)do_show_toptip_view_toptip_string:(NSString *)toptip_string{
    
    
    self.toptip_string = toptip_string;
    [self do_init_toptip_view];
    [self.view addSubview:toptippanel];
    [UIView beginAnimations:@"hid" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    toptippanel.alpha=1.0;
    CGRect rect=toptippanel.frame;
    rect.origin.y=0.0;
    toptippanel.frame=rect;
    [UIView commitAnimations];
    [toptippanel.delegate action_toptip_did_show];
    [self performSelector:@selector(do_hide_toptip_view) withObject:nil afterDelay:1.5];
    
}
- (void)do_hide_toptip_view{

    [UIView beginAnimations:@"hid" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.5];
    toptippanel.alpha=0.0;
    CGRect rect=toptippanel.frame;
    rect.origin.y=-46.0;
    toptippanel.frame=rect;
    [UIView commitAnimations];
    [toptippanel.delegate action_toptip_did_hide];
    [self do_destory_toptip_view];
     
}
- (void)do_destory_toptip_view{
   // [toptippanel removeFromSuperview];
    toptippanel = nil;
}

@end
