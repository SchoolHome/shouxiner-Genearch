//
//  BBFXViewController.m
//  teacher
//
//  Created by mac on 14/11/7.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBFXViewController.h"
#import "BBFXTableViewCell.h"
#import "BBFXGridView.h"
#import "BBFXModel.h"
#import "BBFXDetailViewController.h"
#import "BBFXAdScrollView.h"
#import "BBFXServiceView.h"
#import "BBUITabBarController.h"
#import <CoreLocation/CoreLocation.h>

@interface BBFXViewController ()
{
    BBFXAdScrollView *adScrollView;
    BBFXServiceView *serviceView;
    CLLocationManager *locationManager;//给js提供定位数据
}
@property (nonatomic, strong) NSMutableArray *discoverArray;
@property (nonatomic, strong) NSMutableArray *serviceArray;
@end

@implementation BBFXViewController

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([@"discoverResult" isEqualToString:keyPath]){
        [self initContentData];
    }
}

-(id)init{
    self = [super init];
    if (self) {
        [[PalmUIManagement sharedInstance] addObserver:self forKeyPath:@"discoverResult" options:0 context:nil];
        _discoverArray = [[NSMutableArray alloc] init];
        _serviceArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([self.discoverArray count] > 0) {
        [self.navigationController setNavigationBarHidden:YES];
    }else{
        [self.navigationController setNavigationBarHidden:NO];
    }
    [self reloadFxScrollView];
    if (adScrollView) {
        [adScrollView restartTimer];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    if (adScrollView) {
        [adScrollView setTimerPose];
    }
}

-(void)loadView
{
    [super loadView];
    self.navigationItem.title = @"发现";
    fxScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.screenHeight)];
    
    fxWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, fxScrollView.frame.size.width, fxScrollView.frame.size.height)];
    [fxWebView.scrollView setScrollEnabled:NO];
    [fxWebView setDelegate:(id<UIWebViewDelegate>)self];
    [fxWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.shouxiner.com/webview/webview_login/groupon/find/gfind"]]];
    [fxScrollView addSubview:fxWebView];
    
    [self.view addSubview:fxScrollView];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)initContentData
{
    if ([PalmUIManagement sharedInstance].discoverResult) {
        NSDictionary *discoverResult = [PalmUIManagement sharedInstance].discoverResult;
        if ([discoverResult[@"errno"] integerValue]==0) {
            [self.discoverArray removeAllObjects];
            NSDictionary *dataResult = discoverResult[@"data"];
            if (![dataResult[@"discover"] isKindOfClass:[NSNull class]]) {
                NSDictionary *discoverDic = dataResult[@"discover"];
                for (NSString *key in [discoverDic allKeys]) {
                    NSDictionary *oneDiscover = discoverDic[key];
                    BBFXModel *oneModel = [[BBFXModel alloc] initWithJson:oneDiscover];
                    [self.discoverArray addObject:oneModel];
                }
            }
            if (![dataResult[@"service"] isKindOfClass:[NSNull class]]) {
                [self.serviceArray removeAllObjects];
                NSDictionary *serviceDic = dataResult[@"service"];
//                for (int i=0; i<3; i++) {
//                    for (NSString *key in [serviceDic allKeys]) {
//                        NSDictionary *oneService = serviceDic[key];
//                        BBFXModel *model = [[BBFXModel alloc] initWithJson:oneService];
//                        [self.serviceArray addObject:model];
//                    }
//                }
                for (NSString *key in [serviceDic allKeys]) {
                    NSDictionary *oneService = serviceDic[key];
                    BBFXModel *model = [[BBFXModel alloc] initWithJson:oneService];
                    [self.serviceArray addObject:model];
                }
            }
            [self reloadFxScrollView];
        }
    }else{
        [[PalmUIManagement sharedInstance] getDiscoverData];
    }
}

-(void)reloadFxScrollView
{
    if ([self.discoverArray count] > 0) {
        CGFloat heightFix = 20.f;
        if (IOS7) {
            heightFix = 20.f;
        }else{
            heightFix = 0;
        }
        [self.navigationController setNavigationBarHidden:YES];
        [fxScrollView setFrame:CGRectMake(0, heightFix, self.view.frame.size.width, self.screenHeight-49-heightFix)];
    }else{
        [self.navigationController setNavigationBarHidden:NO];
        [fxScrollView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.screenHeight-44-49-20)];
    }
    
    [self addDiscoverAdv];
    [self addDiscoverService];

    CGRect fxWebFrame = fxWebView.frame;
    fxWebView.frame = CGRectMake(0, adScrollView.frame.size.height+serviceView.frame.size.height, fxWebFrame.size.width, fxWebFrame.size.height);
    CGFloat heightFix = 20.f;
    if (!IOS7) {
        heightFix = 20.f;
    }else{
        heightFix = 0;
    }
    [fxScrollView setContentSize:CGSizeMake(fxScrollView.frame.size.width, fxWebFrame.size.height+adScrollView.frame.size.height+serviceView.frame.size.height+heightFix)];
}

-(void)addDiscoverAdv
{
    if ([self.discoverArray count] > 0) {
        if (!adScrollView) {
            adScrollView = [[BBFXAdScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 82.f)];
            [adScrollView setDelegate:(id<BBFXAdScrollViewDelegate>)self];
            [fxScrollView addSubview:adScrollView];
        }
        [adScrollView setAdsArray:self.discoverArray];
    }else{
        if (adScrollView) {
            [adScrollView removeFromSuperview];
            adScrollView = nil;
        }
    }
}

-(void)addDiscoverService
{
    if ([self.serviceArray count] > 0) {
        CGFloat sHeight = ([self.serviceArray count] > 4)?140:75;
        if (!serviceView) {
            serviceView = [[BBFXServiceView alloc] initWithFrame:CGRectMake(0, adScrollView.frame.size.height, fxScrollView.frame.size.width, sHeight)];
            [serviceView setDelegate:(id<BBFXServiceViewDelegate>)self];
            [fxScrollView addSubview:serviceView];
        }
        [serviceView setFrame:CGRectMake(0, adScrollView.frame.size.height, fxScrollView.frame.size.width, sHeight)];
        [serviceView setServiceArray:self.serviceArray];
    }else{
        if (serviceView) {
            [serviceView removeFromSuperview];
            serviceView = nil;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma adscrollview
-(void)adViewTapped:(BBFXModel *)model
{
    if (model.url && model.url.length>0) {
        BBFXDetailViewController *detailViewController = [[BBFXDetailViewController alloc] init];
        detailViewController.url = [NSURL URLWithString:model.url];
        [detailViewController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
}

#pragma serviceView
-(void)tapOneFXService:(BBFXGridView *)gridView
{
    NSInteger index = gridView.pageIndex*8 + gridView.numIndex;
    BBFXModel *model = [self.serviceArray objectAtIndex:index];
    if (model.url && model.url.length>0) {
        if (model.isNew) {
            model.isNew = NO;
            BBUITabBarController *tabBar = (BBUITabBarController *)self.tabBarController;
            NSInteger count = [tabBar.markYZS.text integerValue];
            count = count - 1;
            if (count == 0) {
                [tabBar.markYZS setHidden:YES];
            }else{
                [tabBar.markYZS setText:[NSString stringWithFormat:@"%d", count]];
            }
        }
        [gridView.flagNew setHidden:YES];
        BBFXDetailViewController *detailViewController = [[BBFXDetailViewController alloc] init];
        detailViewController.url = [NSURL URLWithString:model.url];
        [detailViewController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
}

#pragma webview
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

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
    CGRect frame = webView.frame;
    fxWebView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, height);
    [fxScrollView setContentSize:CGSizeMake(fxScrollView.frame.size.width, height+adScrollView.frame.size.height+serviceView.frame.size.height)];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

-(void)open:(NSArray *)args
{
    NSString *url = [args objectAtIndex:0];
    if (url && url.length>0) {
        BBFXDetailViewController *detailViewController = [[BBFXDetailViewController alloc] init];
        detailViewController.url = [NSURL URLWithString:url];
        [detailViewController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
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

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //经度
    NSString *lon = [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.longitude];
    //纬度
    NSString *lat = [[NSString alloc]initWithFormat:@"%g",newLocation.coordinate.latitude];
    [fxWebView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"onShouxinerLocaterComplete(true, %@, %@)", lon, lat]];
    [locationManager stopUpdatingLocation];
    locationManager = nil;
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"定位失败" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)dealloc
{
    [[PalmUIManagement sharedInstance] removeObserver:self forKeyPath:@"discoverResult"];
}

@end
