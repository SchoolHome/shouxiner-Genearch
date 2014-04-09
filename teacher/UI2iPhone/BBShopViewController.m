//
//  BBShopViewController.m
//  teacher
//
//  Created by mac on 14-3-20.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBShopViewController.h"

@interface BBShopViewController ()
{
    UIWebView *shopWebview;
    UIActivityIndicatorView *activityView;
}
@end

@implementation BBShopViewController

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
    self.navigationItem.title = @"商城";
    shopWebview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [shopWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.shouxiner.com/teacher_jfen/mobile_web_shop"]]];
    [shopWebview setDelegate:(id<UIWebViewDelegate>)self];
    
    activityView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [activityView setCenter:shopWebview.center];
    [activityView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [shopWebview addSubview:activityView];
    
    [self.view addSubview:shopWebview];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityView startAnimating];
    [shopWebview addSubview:activityView];
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
