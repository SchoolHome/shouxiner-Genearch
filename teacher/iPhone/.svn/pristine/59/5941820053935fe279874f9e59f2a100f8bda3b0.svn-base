//
//  ProtocolController.m
//  iCouple
//
//  Created by lixiaosong on 12-7-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ProtocolController.h"
#import "FanxerImage.h"
@interface ProtocolController ()
- (void)doBack;
@end

@implementation ProtocolController

- (id)initWithTopImage:(UIImage *)image
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        if(image != nil){
            CPLogInfo(@"zzw:%f zzh:%f",image.size.width,image.size.height);
        }
        _topImage = image;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView * mainView_ = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [mainView_ setBackgroundColor:[UIColor whiteColor]];
    self.view = mainView_;
    

    
    _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    _topImageView.image = _topImage;
    [self.view addSubview:_topImageView];
    
    _topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    _topLabel.backgroundColor = [UIColor clearColor];
    _topLabel.textColor = [UIColor blackColor];
    _topLabel.textAlignment = UITextAlignmentCenter;
    _topLabel.font = [UIFont systemFontOfSize:18];
    _topLabel.text = @"产品使用授权许可协议";
    //[self.view addSubview:_topLabel];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame = CGRectMake(5, 5, 36, 36);

    UIImage * nav_back_img = [UIImage imageNamed:@"sign_nav_btn_back.png"];
    UIImage * nav_back_img_hover = [UIImage imageNamed:@"sign_nav_btn_back_hover.png"];
    [_backButton setImage:nav_back_img forState:UIControlStateNormal];
    [_backButton setImage:nav_back_img_hover forState:UIControlStateHighlighted];
    [_backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_backButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [_backButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [_backButton setTitleEdgeInsets:UIEdgeInsetsMake(10, 10, nav_back_img.size.width/2, nav_back_img.size.height/2)];
    [_backButton addTarget:self action:@selector(doBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 44, 320, 420)];
    _textView.editable = NO;
    NSString * aboutPath_ = [[NSBundle mainBundle] pathForResource:@"about" ofType:@"txt"];
    NSString * aboutString_ = [NSString stringWithContentsOfFile:aboutPath_ encoding:NSUTF8StringEncoding error:nil];
    [_textView setText:aboutString_];
    //[self.view addSubview:_textView];
    
    NSURL * url = [NSURL URLWithString:@"http://static.ishuangshuang.com/protocol.htm"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 44, 320, 420)];
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
    
	// Do any additional setup after loading the view.
}
- (void)doBack{
    [self dismissModalViewControllerAnimated:YES];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
