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


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"notiUnReadCount"]) {
        NSDictionary *dict = [PalmUIManagement sharedInstance].notiUnReadCount;
        NSLog(@"%@",dict);
        
        NSNumber *ct = dict[@"data"][@"count"];
        
        if ([ct intValue] == 0) {
            mark.hidden = YES;
        }else{
            mark.hidden = NO;
            mark.text = [NSString stringWithFormat:@"%d",[ct intValue]];
            CGFloat width = [mark.text sizeWithFont:[UIFont systemFontOfSize:14]
                                  constrainedToSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)].width;
            if (width<17) {
                width = 20;
            }else{
                width = width + 8;
            }
            mark.frame = CGRectMake(215, -5, width, 20);
        }
    }
}


-(id)init{
    self = [super init];
    if (self) {
        //
        [[PalmUIManagement sharedInstance] addObserver:self forKeyPath:@"notiUnReadCount" options:0 context:NULL];
    }
    return self;
}

-(void)checkUnreadCount{
    [[PalmUIManagement sharedInstance] getUnReadNotiCount:1];
    [self performSelector:@selector(checkUnreadCount) withObject:nil afterDelay:5];
}

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
    
    mark = [[UILabel alloc] initWithFrame:CGRectMake(215, -5, 20, 20)];
    mark.font = [UIFont systemFontOfSize:14];
    [_imageTabBar addSubview:mark];
    mark.backgroundColor = [UIColor orangeColor];
    mark.textAlignment = NSTextAlignmentCenter;
    mark.textColor = [UIColor whiteColor];
    CALayer *roundedLayer1= [mark layer];
    //[roundedLayer setMasksToBounds:YES];
    roundedLayer1.cornerRadius = 10.0;
    roundedLayer1.borderWidth = 0.5;
    roundedLayer1.borderColor = [[UIColor grayColor] CGColor];
    mark.text = @"";
    mark.hidden = YES;
    
    [self checkUnreadCount];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

    for (int i = 0 ; i<[_tapImages count]; i++) {
        if (tabBarController.selectedIndex == i) {
            _subTabItem[i].image = [_tapImages objectAtIndex:i];
        }else{
            _subTabItem[i].image = nil;
        }
    }
    
    if (tabBarController.selectedIndex == 2) { // 点击消失
        mark.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{

    [[PalmUIManagement sharedInstance] removeObserver:self forKeyPath:@"notiUnReadCount"];
}

@end
