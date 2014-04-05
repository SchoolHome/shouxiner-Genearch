//
//  BBAddressBookViewController.m
//  teacher
//
//  Created by mac on 14-3-31.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBAddressBookViewController.h"

@interface BBAddressBookViewController ()
{
    UIWebView *addressBookWebView;
    UIActivityIndicatorView *activityView;
}
@end

@implementation BBAddressBookViewController

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
    addressBookWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [addressBookWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.shouxiner.com"]]];
    [addressBookWebView setDelegate:(id<UIWebViewDelegate>)self];
    
    activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [activityView setCenter:addressBookWebView.center];
    [activityView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [addressBookWebView addSubview:activityView];
    
    [self.view addSubview:addressBookWebView];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityView startAnimating];
    [addressBookWebView addSubview:activityView];
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
