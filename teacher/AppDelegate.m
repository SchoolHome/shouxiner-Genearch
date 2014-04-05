////
////  cn_ubox_schoolHomeAppDelegate.m
////  teacher
////
////  Created by singlew on 14-3-2.
////  Copyright (c) 2014年 ws. All rights reserved.
////


#import "AppDelegate.h"
#import "CPSystemEngine.h"
#import "CPUIModelManagement.h"
#import "CPUIModelPersonalInfo.h"
#import "CPLGModelAccount.h"

#import "LoginViewController.h"
#import "Login.h"
#import "RegistFirstViewController.h"
#import "RegistViewController.h"
#import "VerifyViewCodeController.h"
#import "Guid07ViewController.h"
#import "FanxerHeader.h"

#import "HomePageViewController.h"
#import "TalkingData.h"
#import "AudioRouteChange.h"
#import "AlarmClockHelper.h"
#import "HPStatusBarTipView.h"
#import "MediaStatusManager.h"
#import "CoreUtils.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize login_nav_c = _login_nav_c;
@synthesize verify_nav_c = _verify_nav_c;
@synthesize ground_nav_c = _ground_nav_c;
@synthesize guid_nav_c = _guid_nav_c;
@synthesize latestActiveTime = _latestActiveTime;

- (void)do_clear_controllers{     // 清除多余的controller，用于退出登录。。。
    for (UIView *aView in [self.window subviews]) {
        [aView removeFromSuperview];
    }
    self.ground_nav_c = nil;
}

- (void)launchLogin{
    [self do_clear_controllers];
    Login * login_c_temp = [[Login alloc] init];
    UINavigationController * login_nav_c_temp = [[UINavigationController alloc] initWithRootViewController:login_c_temp];
    [login_nav_c_temp setNavigationBarHidden:YES];
    self.login_nav_c = login_nav_c_temp;
    login_nav_c_temp = nil;
    login_c_temp = nil;
    [self.window addSubview:self.login_nav_c.view];
}

- (void)launchApp{
    [self do_clear_controllers];
    for (UIView *aView in [self.window subviews]) {
        [aView removeFromSuperview];
    }
    BBUITabBarController *tab = [[BBUITabBarController alloc] init];
    self.window.rootViewController = tab;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    CPLogInfo(@"launchOptions %@",launchOptions);
    [[PalmUIManagement sharedInstance] addObserver:self forKeyPath:@"checkVersion" options:0 context:nil];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navbar_back"] forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,[UIFont boldSystemFontOfSize:18],UITextAttributeFont, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    // Configure logging framework
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    
    [DDLog addLogger:fileLogger];
	[DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[CPSystemEngine sharedInstance] initSystem];
    [[PalmUIManagement sharedInstance] postCheckVersion];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
#ifndef SYS_STATE_MIGR
    CPUIModelManagement * model_management = [CPUIModelManagement sharedInstance];
    NSInteger sys_status_int = [model_management sysOnlineStatus];
    if(sys_status_int == SYS_STATUS_NO_ACTIVE){
//        [self do_launch_verify];
    }else if(sys_status_int == SYS_STATUS_NO_LOGINED){
        //
        if ([[CPUIModelManagement sharedInstance] hasLoginUser]) {
            [self launchLogin]; // 非第一次登录
        }else{
            [self launchLogin];
        }
    }else{
        [self launchApp];
    }
#else
    NSInteger accState = [[CPUIModelManagement sharedInstance] accountState];
    switch (accState){
        case ACCOUNT_STATE_INACTIVE:{
//            [self do_launch_verify];
        }
        break;
        case ACCOUNT_STATE_NEVER_LOGIN:{
            if ([[CPUIModelManagement sharedInstance] hasLoginUser]){
                [self launchLogin]; // 非第一次登录
            }else{
                [self launchLogin];
            }
        }
        break;
        default:{
            [self launchApp];
        }
        break;
    }
#endif
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqual:@"checkVersion"]) {
        NSDictionary *result = [PalmUIManagement sharedInstance].checkVersion;
        
    }
}

- (void)applicationWillResignActive:(UIApplication *)application{
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    [[CPUIModelManagement sharedInstance] sysInActive];
}

- (void)applicationWillEnterForeground:(UIApplication *)application{
    [self setLatestActiveTime:[CoreUtils getLongFormatWithNowDate]];
    [[CPUIModelManagement sharedInstance] sysActive];
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
    [self setLatestActiveTime:[CoreUtils getLongFormatWithNowDate]];
    // 还原播放控制
    [[MediaStatusManager sharedInstance] resetStatus];
    [[CPSystemEngine sharedInstance] xmppReconnect];
}

- (void)applicationWillTerminate:(UIApplication *)application{
    [[CPUIModelManagement sharedInstance] sysInActive];
}

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken{
    [[CPUIModelManagement sharedInstance] uploadDeviceToken:devToken];
	CPLogInfo(@"devToken[%@], len=%d", devToken, [devToken length]);
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{

}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    CPLogInfo(@"userInfo  %@",userInfo);
    NSNumber *nowTime = [CoreUtils getLongFormatWithNowDate];
    int gap = [nowTime integerValue] - [self.latestActiveTime integerValue];
    if (gap <=1000){
        [self.ground_nav_c popToRootViewControllerAnimated:YES]; //统一到首页
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    CPLogInfo(@"%@",error);
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    CPLogInfo(@"");
}
@end
