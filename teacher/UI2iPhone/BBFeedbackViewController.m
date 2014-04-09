//
//  BBFeedbackViewController.m
//  teacher
//
//  Created by mac on 14-3-25.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBFeedbackViewController.h"

@interface BBFeedbackViewController ()
{
    UIWebView *feedbackWebView;
    UIActivityIndicatorView *activityView;
}
@end

@implementation BBFeedbackViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    [super loadView];
    feedbackWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [feedbackWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.shouxiner.com/advicebox/mobile_web_advice"]]];
    [feedbackWebView setDelegate:(id<UIWebViewDelegate>)self];
    
    activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [activityView setCenter:feedbackWebView.center];
    [activityView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [feedbackWebView addSubview:activityView];
    
    [self.view addSubview:feedbackWebView];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityView startAnimating];
    [feedbackWebView addSubview:activityView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityView stopAnimating];
    [activityView removeFromSuperview];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [activityView stopAnimating];
    [activityView removeFromSuperview];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
