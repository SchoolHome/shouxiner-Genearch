//
//  BBImagePreviewVIewController.m
//  teacher
//
//  Created by ZhangQing on 14-11-4.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBImagePreviewVIewController.h"

#import "BBPostPBXViewController.h"

#import "ImageUtil.h"
@interface BBImagePreviewVIewController ()
{
    UIView *toolBar;
    UIView *bottomBar;
    UIImageView *previewImageView;
    
    BOOL viewIsHide;
}
@property (nonatomic, strong) UIImage *image;
@end
@implementation BBImagePreviewVIewController

- (id)initWithPreviewImage : (UIImage *)image
{
    self = [super init];
    if (self) {
        self.image = image;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];

    CGFloat scale = _image.size.height/_image.size.width;
    /*
    CGRect frame = scale > 1 ? CGRectMake(0.f, 0.f, self.screenWidth, self.screenHeight):
    CGRectMake(self.screenWidth-(self.screenWidth*scale)/2, (self.screenHeight-self.screenHeight*scale)/2, self.screenWidth*scale, self.screenHeight*scale);
    */
    previewImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.screenWidth, self.screenHeight)];
    [previewImageView setImage:_image];
    if (scale < 1) previewImageView.contentMode = UIViewContentModeScaleAspectFit;
    previewImageView.userInteractionEnabled = YES;
    [self.view addSubview:previewImageView];
    
    toolBar = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.screenWidth, 52.f)];
    toolBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:toolBar];
    
    UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
    [close setFrame:CGRectMake(10.f, 0.f, 54.f, 42.f)];
    [close setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [close setImageEdgeInsets:UIEdgeInsetsMake(15.f, 15.f, 5.f, 15.f)];
    [close addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [toolBar addSubview:close];
    
    bottomBar = [[UIView alloc] initWithFrame:CGRectMake(0.f, self.screenHeight-94.f, self.screenWidth, 94.f)];
    bottomBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:bottomBar];
    
    UIButton *confirm = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirm setFrame:CGRectMake(self.screenWidth-80.f, 10, 60.f, 40.f)];
    [confirm setBackgroundImage:[UIImage imageNamed:@"ok"] forState:UIControlStateNormal];
    [confirm addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchUpInside];
    [bottomBar addSubview:confirm];
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [previewImageView addGestureRecognizer:tapGes];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}

#pragma mark - Actions
- (void)tap
{
    if (!viewIsHide) {
        [UIView animateWithDuration:0.5 animations:^{
            toolBar.alpha = 0.f;
            bottomBar.alpha = 0.f;
        }];
    }else
    {
        [UIView animateWithDuration:0.5 animations:^{
            toolBar.alpha = 1.f;
            bottomBar.alpha = 1.f;
        }];
    }
    viewIsHide = !viewIsHide;
}

- (void)close
{
    //[self.navigationController popToRootViewControllerAnimated:YES];
    NSMutableArray *navControllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    for (id controller in navControllers) {
        if ([controller isKindOfClass:[BBPostPBXViewController class]]) {
            [navControllers removeObject:controller];
            [self.navigationController setViewControllers:[NSArray arrayWithArray:navControllers] animated:NO];
            break;
        }
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)confirm
{
    BBPostPBXViewController *postPBX = [[BBPostPBXViewController alloc] initWithImages:[NSArray arrayWithObject:self.image]];
    postPBX.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:postPBX animated:YES];
}



@end
