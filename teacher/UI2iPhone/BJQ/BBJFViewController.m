//
//  BBJFViewController.m
//  teacher
//
//  Created by mtf on 14-4-13.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBJFViewController.h"
#import "BBBasePostViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface BBJFViewController ()
{
    UIWebView  *adWebview;
    UIActivityIndicatorView *activityIndicator;
    BOOL isShowNavBar;//根据js判断是否显示nav
    CLLocationManager *locationManager;//给js提供定位数据
    NSString *activeID;
}
@end

@implementation BBJFViewController

-(void)backButtonTaped:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(0.f, 7.f, 30.f, 30.f)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.title = @"手心商城";
    int heightFix = 20;
    if (IOS7) {
        heightFix = 20;
    }else{
        heightFix = 0;
    }
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.bounds.size.height-44-heightFix)];
    [webView setDelegate:(id<UIWebViewDelegate>)self];
    [self.view addSubview:webView];
    
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:_url];
    [webView loadRequest:req];
}

-(void)setUrl:(NSURL *)url{
    _url = url;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeOther || navigationType == UIWebViewNavigationTypeLinkClicked) {
        NSURL *url = [request URL];
        NSString *funcUrl= [[url absoluteString] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        if ([funcUrl rangeOfString:@"shouxiner://function:"].location != NSNotFound) {
            NSRange range = [funcUrl rangeOfString:@"shouxiner://function:"];
            NSString *subUrl = [funcUrl substringFromIndex:range.length];
            NSData* data = [subUrl dataUsingEncoding:NSUTF8StringEncoding];
            NSError* error = nil;
            id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSDictionary *objDic = result;
            NSString *funcName = [NSString stringWithFormat:@"%@:", objDic[@"function"]];
            NSArray *args = objDic[@"args"];
            SEL selector = NSSelectorFromString(funcName);
            [self performSelector:selector withObject:args];
            return NO;
        }
    }
    return YES;
}
//隐藏nav
-(void)setTitleBarVisible:(NSArray *)args
{
    isShowNavBar = [args[0] boolValue];
    if (isShowNavBar) {
        [adWebview setFrame:CGRectMake(0.f, 0, self.view.frame.size.width, self.screenHeight-44)];
    }else{
        [adWebview setFrame:CGRectMake(0.f, 0, self.view.frame.size.width, self.screenHeight)];
    }
    [self.navigationController setNavigationBarHidden:(!isShowNavBar)];
    [adWebview stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"onShouxinerSetTitleBarVisibleComplete(true)"]];
}
//定位
-(void)getLocate:(NSArray *)args
{
    if (!locationManager) {
        locationManager = [[CLLocationManager alloc]init];
    }
    [locationManager setDelegate:(id<CLLocationManagerDelegate>)self];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}
//发表话题
-(void)publishTopic:(NSArray *)args
{
    activeID = args[0];
    BBBasePostViewController *shareVC = [[BBBasePostViewController alloc] initWithPostType:POST_TYPE_HDFX];
    shareVC.activeID = activeID;
    shareVC.activeTitle = args[1];
    shareVC.activeContent = args[2];
    [self.navigationController pushViewController:shareVC animated:YES];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //经度
    NSString *lon = [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.longitude];
    //纬度
    NSString *lat = [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.latitude];
    [adWebview stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"onShouxinerLocaterComplete(true, %@, %@)", lon, lat]];
    [locationManager stopUpdatingLocation];
    locationManager = nil;
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"定位失败" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

-(void)successCallBack:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BJQNeedRefresh" object:nil];
    [adWebview stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"onShouxinerPublishTopicComplete(true, %@)", [notification object]]];
}

-(void) close:(NSArray *)args
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)dealloc
{
    [adWebview setDelegate:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"WebDetailNeedCallBack" object:nil];
}

@end
