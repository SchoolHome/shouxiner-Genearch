//
//  DisplaySelectedMemberView.m
//  teacher
//
//  Created by ZhangQing on 14-3-24.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#define HeadImageViewSpace 6.f
#define EmptyHeadImageviewTag 1001
#import "DisplaySelectedMemberView.h"
#import "CPUIModelUserInfo.h"
@implementation DisplaySelectedMemberView
@synthesize selectedMembersArray = _selectedMembersArray;
-(NSArray *)selectedMembersArray
{
    if (!_selectedMembersArray) {
        _selectedMembersArray = [[NSArray alloc] init];
    }
    return _selectedMembersArray;
}
-(void)setSelectedMembersArray:(NSArray *)selectedMembersArray
{
    [self.membersScrollview setContentSize:CGSizeMake((_emptyHeadImageview.frame.size.width+HeadImageViewSpace)*(selectedMembersArray.count+1)+3, self.membersScrollview.frame.size.height)];
    
    if (selectedMembersArray.count > self.selectedMembersArray.count && self.selectedMembersArray.count != 0) {
        //add member
        self.isAddMember = YES;
    }else
    {
        //remove member
        self.isAddMember = NO;
    }
    
    if (selectedMembersArray.count == 0 ) {
        [_confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
        _confirmBtn.enabled = NO;
    }else
    {
        [_confirmBtn setTitle:[NSString stringWithFormat:@"确定(%d)",selectedMembersArray.count] forState:UIControlStateNormal];
        _confirmBtn.enabled = YES;
    }
    _selectedMembersArray = [[NSArray alloc] initWithArray:selectedMembersArray];
    [self setNeedsDisplay];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:207/255.f green:204/255.f blue:195/255.f alpha:1.f];
        
        _membersScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, 320-80.f, frame.size.height)];
        _membersScrollview.showsVerticalScrollIndicator = NO;
        _membersScrollview.backgroundColor = [UIColor clearColor];
        [self addSubview:_membersScrollview];
        
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirmBtn setFrame:CGRectMake(320.f-70.f, (frame.size.height-32)/2, 59.f, 32.f)];
        [_confirmBtn addTarget:self action:@selector(beginGroupChat) forControlEvents:UIControlEventTouchUpInside];
        [_confirmBtn setBackgroundImage:[UIImage imageNamed:@"ZJZGroupChat"] forState:UIControlStateNormal];
        [_confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
        _confirmBtn.enabled = NO;
        [self addSubview:_confirmBtn];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
        
        
        _emptyHeadImageview = [[UIImageView alloc] initWithFrame:CGRectMake(3.f, (frame.size.height-42)/2, 42.f, 42.f)];
        _emptyHeadImageview.image = [UIImage imageNamed:@"ZJZEmptyHeader"];
        _emptyHeadImageview.tag = EmptyHeadImageviewTag;
        [_membersScrollview  addSubview:_emptyHeadImageview];

        
        
    }
    return self;
}

-(void)beginGroupChat
{
    if ([self.delegate respondsToSelector:@selector(confirmBtnTapped:)]) {
        [self.delegate confirmBtnTapped:self.selectedMembersArray];
    }
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    if (self.selectedMembersArray.count == 0) {
        self.isAddMember = NO;
    }
    
    if (self.isAddMember) {
        UIImageView *headImageview = [[UIImageView alloc] initWithFrame:CGRectMake(3.f+(self.emptyHeadImageview.frame.size.width+HeadImageViewSpace)*(self.selectedMembersArray.count-1),
                                                                                   self.emptyHeadImageview.frame.origin.y,
                                                                                   self.emptyHeadImageview.frame.size.width,
                                                                                   self.emptyHeadImageview.frame.size.width)];
        CPUIModelUserInfo *userinfo = [self.selectedMembersArray lastObject];
        
        
        UIImage *avatarImage = [UIImage imageWithContentsOfFile:userinfo.headerPath];
        if (!avatarImage) {
            avatarImage  = [UIImage imageNamed:@"girl.png"];
        }
        [headImageview setImage:avatarImage];
        [headImageview.layer setMasksToBounds:YES];
        headImageview.layer.borderWidth = 0;
        headImageview.layer.cornerRadius = 26.0;
        headImageview.layer.borderColor = [[UIColor clearColor] CGColor];
        [self.membersScrollview addSubview:headImageview];
        

        
    }else
    {
        for (UIView *tempVIew in self.membersScrollview.subviews) {
            if (tempVIew.tag == EmptyHeadImageviewTag) {
                continue;
            }
            [tempVIew removeFromSuperview];
        }
        
        for (int i =1 ; i <= self.selectedMembersArray.count ; i++) {
            CPUIModelUserInfo *tempUserInfo = [self.selectedMembersArray objectAtIndex:i-1];
            
            UIImageView *headImageview = [[UIImageView alloc] initWithFrame:CGRectMake(3.f+(self.emptyHeadImageview.frame.size.width+HeadImageViewSpace)*(i-1),
                                                                                       self.emptyHeadImageview.frame.origin.y,
                                                                                       self.emptyHeadImageview.frame.size.width,
                                                                                       self.emptyHeadImageview.frame.size.width)];
            
            
            UIImage *avatarImage = [UIImage imageWithContentsOfFile:tempUserInfo.headerPath];
            if (!avatarImage) {
                avatarImage  = [UIImage imageNamed:@"girl.png"];
            }
            [headImageview setImage:avatarImage];
            [headImageview.layer setMasksToBounds:YES];
            headImageview.layer.borderWidth = 0;
            headImageview.layer.cornerRadius = 26.0;
            headImageview.layer.borderColor = [[UIColor clearColor] CGColor];
            [self.membersScrollview addSubview:headImageview];
        }
    }
    [self.emptyHeadImageview setFrame:CGRectMake(3.f+(self.emptyHeadImageview.frame.size.width+HeadImageViewSpace)*(self.selectedMembersArray.count),
                                                 self.emptyHeadImageview.frame.origin.y,
                                                 self.emptyHeadImageview.frame.size.width,
                                                 self.emptyHeadImageview.frame.size.width)];


}


@end
