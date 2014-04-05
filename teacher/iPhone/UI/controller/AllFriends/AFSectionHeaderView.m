//
//  AFSectionHeaderView.m
//  AllFriends_dev
//
//  Created by ming bright on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AFSectionHeaderView.h"



///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#pragma mark - AFSectionHeaderView

@interface AFSectionHeaderView()
-(void)setTitle:(NSString *) text_;
@end

@implementation AFSectionHeaderView

+(AFSectionHeaderView *)headerViewWith:(NSString *)title_{
    AFSectionHeaderView *header = [[AFSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 23.5)];
    [header setTitle:title_];
    return header;
}

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.image = [[UIImage imageNamed:@"addressbook_titlebar"] stretchableImageWithLeftCapWidth:3 topCapHeight:0];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0, 1.0, frame.size.width- 5.0, frame.size.height-1.0)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:14.0f];
        [self addSubview:_titleLabel];
    }
    return self;
}

-(void)setTitle:(NSString *) text_{
    _titleLabel.text = text_;
}

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#pragma mark - AFNavgationBar

@implementation AFNavgationBar 

@synthesize backButton;
@synthesize cancelButton;
@synthesize convertButton;
@synthesize chatButton;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImageView *navBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        [self addSubview:navBar];
        navBar.image = [UIImage imageNamed:@"bg_list_top_red"];
        
        UILabel *navBarTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        navBarTitle.backgroundColor = [UIColor clearColor];
        navBarTitle.textColor = [UIColor whiteColor];
        [self addSubview:navBarTitle];
        navBarTitle.text = @"大家";
        navBarTitle.font = [UIFont systemFontOfSize:20];
        navBarTitle.textAlignment = UITextAlignmentCenter;
        navBarTitle.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        navBarTitle.shadowOffset = CGSizeMake(0,-1);
        
        // back
        self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(10, (44-35)/2, 35, 35);
        [self addSubview:backButton];
        [backButton setBackgroundImage:[UIImage imageNamed:@"icon_nav_list_back"] forState:UIControlStateNormal];
        [backButton setBackgroundImage:[UIImage imageNamed:@"sign_nav_icon_list_back_hove"] forState:UIControlStateHighlighted];
        
        // cancel
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.frame = CGRectMake(10, (44-58/2)/2, 134/2, 58/2);
        [self addSubview:cancelButton];
        cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton setBackgroundImage:[UIImage imageNamed:@"topredbar_btn_01_nor"] forState:UIControlStateNormal];
        [cancelButton setBackgroundImage:[UIImage imageNamed:@"topredbar_btn_01_press"] forState:UIControlStateHighlighted];
        
        // convert
        self.convertButton = [UIButton buttonWithType:UIButtonTypeCustom];
        convertButton.frame = CGRectMake(320-174/2-10, 7, 174/2, 58/2);
        [self addSubview:convertButton];
        convertButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        [convertButton setTitle:@"发起新聊天" forState:UIControlStateNormal];
        [convertButton setBackgroundImage:[UIImage imageNamed:@"topredbar_btn_nor"] forState:UIControlStateNormal];
        [convertButton setBackgroundImage:[UIImage imageNamed:@"topredbar_btn_press"] forState:UIControlStateHighlighted];
        
        
        // convert
        self.chatButton = [UIButton buttonWithType:UIButtonTypeCustom];
        chatButton.frame = CGRectMake(320-174/2-10, 7, 174/2, 58/2);
        [self addSubview:chatButton];
        chatButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        [chatButton setTitle:@"开始聊" forState:UIControlStateNormal];
        [chatButton setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.7] forState:UIControlStateDisabled];
        [chatButton setBackgroundImage:[UIImage imageNamed:@"topredbar_btn_nor"] forState:UIControlStateNormal];
        [chatButton setBackgroundImage:[UIImage imageNamed:@"topredbar_btn_press"] forState:UIControlStateHighlighted];
        
    }
    
    return self;
}

@end

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
