//
//  BBHelpViewController.m
//  teacher
//
//  Created by mac on 14-3-25.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBHelpViewController.h"

@interface BBHelpViewController ()
{
    UIWebView *helpWebView;
    UIActivityIndicatorView *activityView;
}
@end

@implementation BBHelpViewController

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
    helpWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [helpWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.shouxiner.com/res/mobilemall/helpl.html"]]];
    [helpWebView setDelegate:(id<UIWebViewDelegate>)self];
    
    activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [activityView setCenter:helpWebView.center];
    [activityView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [helpWebView addSubview:activityView];
    [self.view addSubview:helpWebView];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityView startAnimating];
    [helpWebView addSubview:activityView];
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
