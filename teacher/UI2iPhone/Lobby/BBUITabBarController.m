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
    
    _imageTabBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 49)];
    _imageTabBar.image = [UIImage imageNamed:@"BBBottomBG"];
    _imageTabBar.backgroundColor = [UIColor redColor];
    
    [self.tabBar addSubview:_imageTabBar];
    [self.tabBar bringSubviewToFront:_imageTabBar];
    
    _tapImages = [[NSArray alloc] initWithObjects:
                  [UIImage imageNamed:@"BBBottomIndexPress1"],
                  [UIImage imageNamed:@"BBBottomIndexPress2"],
                  [UIImage imageNamed:@"BBBottomIndexPress3"],
                  [UIImage imageNamed:@"BBBottomIndexPress4"],
                  nil];
    NSArray *backImages = [[NSArray alloc] initWithObjects:
                  [UIImage imageNamed:@"BBBottomIndex1"],
                  [UIImage imageNamed:@"BBBottomIndex2"],
                  [UIImage imageNamed:@"BBBottomIndex3"],
                  [UIImage imageNamed:@"BBBottomIndex4"],
                  nil];
    
    
    
    for (int i = 0 ; i<[_tapImages count]; i++) {
        
        UIImageView *backItem = [[UIImageView alloc] initWithFrame:CGRectMake(320/4.0f*i, 0, 320/4.0f, 49)];
        [_imageTabBar addSubview:backItem];
        backItem.image = [backImages objectAtIndex:i];
        
        _subTabItem[i] = [[UIImageView alloc] initWithFrame:CGRectMake(320/4.0f*i, 0, 320/4.0f, 49)];
        _subTabItem[i].backgroundColor = [UIColor clearColor];
        [_imageTabBar addSubview:_subTabItem[i]];
        
        if (0 == i) {
            _subTabItem[i].image = [_tapImages objectAtIndex:i];
        }else{
            _subTabItem[i].image = nil;
        }
    }
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

    for (int i = 0 ; i<[_tapImages count]; i++) {
        if (tabBarController.selectedIndex == i) {
            _subTabItem[i].image = [_tapImages objectAtIndex:i];
        }else{
            _subTabItem[i].image = nil;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
