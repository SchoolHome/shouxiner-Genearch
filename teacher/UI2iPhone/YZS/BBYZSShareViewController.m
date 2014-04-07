//
//  BBYZSShareViewController.m
//  teacher
//
//  Created by xxx on 14-3-20.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBYZSShareViewController.h"

@interface BBYZSShareViewController ()

@end

@implementation BBYZSShareViewController

-(void)loading{
    
    sleep(3);
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)sendButtonTaped:(id)sender{
    [self showWhileExecuting:@selector(loading) withText:@"发送" withDetailText:@"正在发送..."];
}

-(void)backButtonTaped:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = @"分享";
    
    // left
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setFrame:CGRectMake(0.f, 7.f, 30.f, 30.f)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"BBBack"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    // right
    UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sendButton setFrame:CGRectMake(0.f, 7.f, 30.f, 30.f)];
    [sendButton setBackgroundImage:[UIImage imageNamed:@"BBSendButton"] forState:UIControlStateNormal];
    [sendButton addTarget:self action:@selector(sendButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:sendButton];
    
    
    UIView *textBack = [[UIView alloc] initWithFrame:CGRectMake(15, 15, 320-30, 70)];
    [self.view addSubview:textBack];
    CALayer *roundedLayer0 = [textBack layer];
    [roundedLayer0 setMasksToBounds:YES];
    roundedLayer0.cornerRadius = 8.0;
    roundedLayer0.borderWidth = 1;
    roundedLayer0.borderColor = [[UIColor lightGrayColor] CGColor];
    
    thingsTextView = [[UIPlaceHolderTextView alloc] initWithFrame:CGRectMake(20, 20, 320-40, 60)];
    [self.view addSubview:thingsTextView];
    thingsTextView.backgroundColor = [UIColor clearColor];
    thingsTextView.placeholder = @"分享新鲜事...";
    
    UIButton *link = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:link];
    
    UIImageView *linkIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 45, 45)];
    [link addSubview:linkIcon];
    
    UILabel *linkTitle = [[UILabel alloc] initWithFrame:CGRectMake(65, 5, 320-30-70, 20)];
    [link addSubview:linkTitle];
    
    UILabel *linkContent = [[UILabel alloc] initWithFrame:CGRectMake(65, 25, 320-30-70, 30)];
    [link addSubview:linkContent];
    linkContent.textColor = [UIColor colorWithHexString:@"#4a7f9d"];
    
    link.frame = CGRectMake(15, 100, 320-30, 65);//
    link.backgroundColor = [UIColor whiteColor];
    CALayer *roundedLayer = [link layer];
    [roundedLayer setMasksToBounds:YES];
    roundedLayer.cornerRadius = 8.0;
    roundedLayer.borderWidth = 1;
    roundedLayer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    linkIcon.backgroundColor = [UIColor grayColor];
    
    linkTitle.text = @"教育局新指示";
    linkTitle.font = [UIFont systemFontOfSize:14];
    
    linkContent.text = @"教育局新指示，发言人说XXXXX、教育局新指示，发言人说XXXXX、教育局新指示，";
    linkContent.font = [UIFont systemFontOfSize:12];
    linkContent.numberOfLines = 2;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [thingsTextView resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
