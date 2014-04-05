//
//  BBUITabBarController.m
//  BBTeacher
//
//  Created by xxx on 14-3-4.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "BBUITabBarController.h"

@interface BBUITabBarController ()

@end

@implementation BBUITabBarController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    BBBJQViewController *c1 = [[BBBJQViewController alloc] init];
    UINavigationController *n1 = [[UINavigationController alloc] initWithRootViewController:c1];
    n1.tabBarItem.title = @"BJQ";
    
    BBZJZViewController *c2 = [[BBZJZViewController alloc] init];
    UINavigationController *n2 = [[UINavigationController alloc] initWithRootViewController:c2];
    n2.tabBarItem.title = @"ZJZ";
    
    BBYZSViewController *c3 = [[BBYZSViewController alloc] init];
    UINavigationController *n3 = [[UINavigationController alloc] initWithRootViewController:c3];
    n3.tabBarItem.title = @"YZS";
    
    BBMeViewController *c4 = [[BBMeViewController alloc] init];
    UINavigationController *n4 = [[UINavigationController alloc] initWithRootViewController:c4];
    n4.tabBarItem.title = @"ME";
    
    NSArray *ctrls = [NSArray arrayWithObjects:n1,n2,n3,n4,nil];
    self.viewControllers = ctrls;
    self.tabBar.tintColor = [UIColor blackColor];
    self.selectedIndex = 0;
    self.delegate = (id<UITabBarControllerDelegate>)self;
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
