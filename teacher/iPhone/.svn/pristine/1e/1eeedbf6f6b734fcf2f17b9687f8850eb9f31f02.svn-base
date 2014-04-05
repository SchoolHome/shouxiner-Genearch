//
//  HomeFriendsView.m
//  iCouple
//
//  Created by qing zhang on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeFriendsView.h"

#define friendTableViewTag 90011
#define imageviewTextTag 90012
#define btnBelowTableviewTag 90013
#define btnAboveTableviewTag 90014
#define imageviewBottomTextTag 90015
@implementation HomeFriendsView
@synthesize btnPeopleAndDelete = _btnPeopleAndDelete;
-(void)custom
{
   
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView *imageviewBGTitle = [[UIImageView alloc] initWithFrame:CGRectMake(60.f, 480-155, 395/2, 15.f)];
        [imageviewBGTitle setImage:[UIImage imageNamed:@"item_txt_join_2.png"]];
        //[self addSubview:imageviewBGTitle];
        
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [btn setFrame:CGRectMake(0, 280, 320.f, 180)];
//        [self addSubview:btn];
        
        HomeFriendsTableView *tableview = [[HomeFriendsTableView alloc] initWithFrame:CGRectMake(0.f, imageviewDisplayPart+8, 320, 460-imageviewDisplayPart-8) style:UITableViewStylePlain];
//        UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0.f, tableviewYbeginPoint+1, 320, 460-tableviewYbeginPoint) style:UITableViewStylePlain];
        //tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableview.homeFriendsTableviewDelegate = self;
        tableview.delegate   = self;
        tableview.dataSource = self;
        tableview.showsVerticalScrollIndicator = NO;
        tableview.backgroundColor = [UIColor clearColor];
        tableview.tag = friendTableViewTag;
        self.tableviewDownPart = tableview;
        [self  addSubview:tableview];

//        UIButton *btnCustom = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btnCustom setFrame:CGRectMake(0, 280, 320.f, 180)];
//        [btnCustom addTarget:self action:@selector(custom) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:btnCustom];
        
//         UITapGestureRecognizer *tapInTableview = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInTableview)];
//        [tableview addGestureRecognizer:tapInTableview];
        
        [self.imageviewUpPart setImage:[UIImage imageNamed:@"pic_firend.jpg"]];

//        
//        self.btnPeopleAndDelete = [UIButton buttonWithType:UIButtonTypeCustom];
//        [self.btnPeopleAndDelete setFrame:CGRectMake(320.f-60.f, 0.f, 60.f, 60.f)];
//        [self.btnPeopleAndDelete setBackgroundImage:[UIImage imageNamed:@"btn_people.png"] forState:UIControlStateNormal];
//        [self.btnPeopleAndDelete setBackgroundImage:[UIImage imageNamed:@"btn_people_press.png"] forState:UIControlStateHighlighted];
//        [self.btnPeopleAndDelete addTarget:self action:@selector(btn_ToGoPeople:) forControlEvents:UIControlEventTouchUpInside];
//        self.btnPeopleAndDelete.tag = 90001;
//        [self addSubview:self.btnPeopleAndDelete];
        
        hideBordInIMView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 145.f, 320, 25.f)];
        [hideBordInIMView setImage:[UIImage imageNamed:@"im_mask2.png"]];
        [self addSubview:hideBordInIMView];
        
    }
    return self;
}
//进入破冰
-(void)beginBreakIcePageView
{
//    UIImageView *imageviewText = (UIImageView *)[self viewWithTag:imageviewTextTag];
//    if (!imageviewText) {
//        imageviewText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"item_friends_Ice-breaking.jpg"]];
//        [imageviewText setFrame:CGRectMake(55.f, 310.f, 210.f, 47.f)];
//        imageviewText.tag = imageviewTextTag;
//        //[self addSubview:imageviewText];
//        [self insertSubview:imageviewText belowSubview:[self viewWithTag:friendTableViewTag]];
//    }

    UIButton *btnBelowTableview = (UIButton *)[self viewWithTag:btnBelowTableviewTag];
    if (!btnBelowTableview) {
        btnBelowTableview = [UIButton buttonWithType:UIButtonTypeCustom];
        btnBelowTableview.tag = btnBelowTableviewTag;
        [btnBelowTableview setFrame:CGRectMake(0.f, 400.f, 320, 60.f)];
        UIImage *imageNormal1 = [UIImage imageNamed:@"pb_bar_friend.png"];
        //UIImage *imageNormal = [imageNormal1 stretchableImageWithLeftCapWidth:imageNormal1.size.width/2 topCapHeight:0];
        
        UIImage *imagePress1 = [UIImage imageNamed:@"pb_bar_friend_press.png"];
        //UIImage *imagePress = [imagePress1 stretchableImageWithLeftCapWidth:imagePress1.size.width/2 topCapHeight:0];
        [btnBelowTableview setBackgroundImage:imageNormal1 forState:UIControlStateNormal];
        [btnBelowTableview setBackgroundImage:imagePress1 forState:UIControlStateHighlighted];
//        [btnBelowTableview setTitle:@"和朋友开辟一片世外桃源吧!" forState:UIControlStateNormal];
//        [btnBelowTableview setTitle:@"和朋友开辟一片世外桃源吧!" forState:UIControlStateHighlighted];
        //[btnBelowTableview setTitleEdgeInsets:UIEdgeInsetsMake(5.f, 5.f, 5.f, 5.f)];
        //btnBelowTableview.titleLabel.font = [UIFont systemFontOfSize:14.f];
        [btnBelowTableview addTarget:self action:@selector(btnAboveTableviewPressUp) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnBelowTableview];
        //[self insertSubview:btnBelowTableview aboveSubview:[self viewWithTag:friendTableViewTag]];
    }
    /*
    UIButton *btnAboveTableview = (UIButton *)[self viewWithTag:btnAboveTableviewTag];
    if (!btnAboveTableview) {
        btnAboveTableview = [UIButton buttonWithType:UIButtonTypeCustom];
        btnAboveTableview.tag = btnAboveTableviewTag;
        [btnAboveTableview setFrame:CGRectMake(43.f, 373.f, 233, 37.f)];
           UIImage *AboveimageNormal1 = [UIImage imageNamed:@"btn_im_warning.png"];
            UIImage *AboveimageNormal = [AboveimageNormal1 stretchableImageWithLeftCapWidth:AboveimageNormal1.size.width/2 topCapHeight:0];
            UIImage *AboveimagePress1 = [UIImage imageNamed:@"btn_im_warningpress.png"];
            UIImage *AboveimagePress = [AboveimagePress1 stretchableImageWithLeftCapWidth:AboveimagePress1.size.width/2 topCapHeight:0];
            [btnAboveTableview setBackgroundImage:AboveimageNormal forState:UIControlStateNormal];
            [btnAboveTableview setBackgroundImage:AboveimagePress forState:UIControlStateHighlighted];
            [btnAboveTableview setTitle:@"和朋友开辟一片世外桃源吧!" forState:UIControlStateNormal];
            [btnAboveTableview setTitle:@"和朋友开辟一片世外桃源吧!" forState:UIControlStateHighlighted];
            [btnAboveTableview setTitleEdgeInsets:UIEdgeInsetsMake(5.f, 5.f, 5.f, 5.f)];
            btnAboveTableview.titleLabel.font = [UIFont systemFontOfSize:14.f];
        //[btnAboveTableview addTarget:self action:@selector(btnAboveTableviewPressDown) forControlEvents:UIControlEventTouchDown];
        [btnAboveTableview addTarget:self action:@selector(btnAboveTableviewPressUp) forControlEvents:UIControlEventTouchUpInside];
        [self insertSubview:btnAboveTableview aboveSubview:[self viewWithTag:friendTableViewTag]];
    }
    UIImageView *imageviewBottomText = (UIImageView *)[self viewWithTag:imageviewBottomTextTag];
    if (imageviewBottomText) {
        imageviewBottomText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"item_friends2_Ice-breaking.jpg"]];
        imageviewBottomText.tag = imageviewBottomTextTag;
        [imageviewBottomText setFrame:CGRectMake(72, 418, 176, 12)];
        [self insertSubview:imageviewBottomText belowSubview:[self viewWithTag:friendTableViewTag]];
    }
    */

}
/*
- (void)scaleImageviewByoffsetValue : (CGFloat)offsetValue
{
    [super scaleImageviewByoffsetValue:offsetValue];
//    if (offsetValue == 0) {
//        if ([self viewWithTag:btnBelowTableviewTag]) {
//            [self viewWithTag:btnBelowTableviewTag].hidden = YES;
//        }
//        if ([self viewWithTag:btnAboveTableviewTag]) {
//            [self viewWithTag:btnAboveTableviewTag].hidden = NO;
//        }
//    }else {
//        if ([self viewWithTag:btnBelowTableviewTag]) {
//            [self viewWithTag:btnBelowTableviewTag].hidden = NO;
//        }
//        if ([self viewWithTag:btnAboveTableviewTag]) {
//            [[self viewWithTag:btnAboveTableviewTag] setHidden:YES];
//        }  
//    }
    
}
 */
//退出破冰
-(void)endBreakIcePageView
{
//    if ([self viewWithTag:imageviewTextTag]) {
//        [[self viewWithTag:imageviewTextTag] removeFromSuperview];
//    }
//    if ([self viewWithTag:btnAboveTableviewTag]) {
//        [[self viewWithTag:btnAboveTableviewTag] removeFromSuperview];
//    }
    if ([self viewWithTag:btnBelowTableviewTag]) {
        [[self viewWithTag:btnBelowTableviewTag] removeFromSuperview];
    }
//    if ([self viewWithTag:imageviewBottomTextTag]) {
//        [[self viewWithTag:imageviewBottomTextTag] removeFromSuperview];
//    }
}

-(void)btnAboveTableviewPressUp
{
//    UIButton *btn = (UIButton *)[self viewWithTag:btnBelowTableviewTag];
//    btn.highlighted = NO;
    if ([self.homeMainViewDelegate respondsToSelector:@selector(turnToContactFriendController)]) {
        [self.homeMainViewDelegate turnToContactFriendController];
    }
}
-(void)friendTableviewTouch
{
    if ([HomeInfo shareObject].isDeletingInCell) {
    [self recoverDeletingStatus];    
    }
    
}
- (void)btn_ToGoPeople:(UIButton *)sender
{
    switch (sender.tag) {
        case 90001:
        {
            if ([self.homeMainViewDelegate respondsToSelector:@selector(goPeopleController)]) {
            [self.homeMainViewDelegate goPeopleController];    
            }
            
        }
            break;
        case 90002:
        {
            [self recoverDeletingStatus];
        }
            break;            
        default:
            break;
    }
}
//- (void)scaleImageviewByoffsetValue : (CGFloat)offsetValue
//{
//    
//    if (offsetValue == 0) {
//        if ([self viewWithTag:btnBelowTableviewTag]) {
//            [self viewWithTag:btnBelowTableviewTag].hidden = YES;
//        }
//        if ([self viewWithTag:btnAboveTableviewTag]) {
//            [self viewWithTag:btnAboveTableviewTag].hidden = NO;
//        }
//         NSLog(@"%@,%@",[self viewWithTag:btnBelowTableviewTag],[self viewWithTag:btnAboveTableviewTag]);
//    }else {
//        if ([self viewWithTag:btnBelowTableviewTag]) {
//            [self viewWithTag:btnBelowTableviewTag].hidden = NO;
//        }
//         NSLog(@"%@,%@",[self viewWithTag:btnBelowTableviewTag],[self viewWithTag:btnAboveTableviewTag]);
//        if ([self viewWithTag:btnAboveTableviewTag] && ![self viewWithTag:btnAboveTableviewTag].hidden) {
//            [[self viewWithTag:btnAboveTableviewTag] setHidden:YES];
//            
//            
//        }  
//   
//    }
//    [super scaleImageviewByoffsetValue:offsetValue];
//}
#pragma mark tableviewDelegate && datasouce
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
#warning 优化时需要修改的地方，改为yes开启优化，目前还未完善   
    friendViewNotNeedRefreshData = NO;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    isScrolling = YES;
    // 当向下滚动的时候发生动画
    if (scrollView.contentOffset.y < 0) {
        [self scaleImageviewByoffsetValue:-scrollView.contentOffset.y];        
    }else {
        //当向下拉还没回弹完毕的时候突然向上滚时 设置成初始位置
        [self scaleImageviewByoffsetValue:0.0f];        
    }

   
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    isScrolling = NO;
    
    if ([HomeInfo shareObject].friendDataNeedRefresh) {
        HomeFriendsTableView *tableview = (HomeFriendsTableView *)[self viewWithTag:friendTableViewTag];
        [tableview reloadData];
        
        [HomeInfo shareObject].friendDataNeedRefresh = NO;
    }
    
    if ([self.homeMainViewDelegate respondsToSelector:@selector(turnOnScrollviewScrollable)]) {
        [self.homeMainViewDelegate turnOnScrollviewScrollable];
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"friendCell";

    HomeFriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[HomeFriendsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier]; 
        cell.homeFriendsTableViewCellDelegate = self;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
    }else
    {
        if (friendViewNotNeedRefreshData)
        {
            [cell setContentWhenfriendViewNotNeedRefreshData:indexPath modelMessageGroup:[[HomeInfo shareObject].friendMessageArray objectAtIndex:indexPath.row]];
            return cell;
        }
    }
    [cell setContent:indexPath modelMessageGroup:[[HomeInfo shareObject].friendMessageArray objectAtIndex:indexPath.row]];

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;        
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([HomeInfo shareObject].friendMessageArray)  return [HomeInfo shareObject].friendMessageArray.count;        
    return 0;
}

-(void)recoverDeletingStatus
{
    [[HomeInfo shareObject] setStatusOff];
    UITableView *tableview = (UITableView *)[self viewWithTag:friendTableViewTag];
    [tableview reloadData];
    
}

-(void)beignDeleteStatusFromFriend
{
    //刷新tableview
    UITableView *tableview = (UITableView *)[self viewWithTag:friendTableViewTag];
    [tableview reloadData];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    if ([HomeInfo shareObject].isDeletingInCell) {
        [self recoverDeletingStatus];
    }
    
}
-(void)openScrollable
{
    if ([self.homeMainViewDelegate respondsToSelector:@selector(turnOnScrollviewScrollable)]) {
        [self.homeMainViewDelegate turnOnScrollviewScrollable];
    }
}
-(void)closeScrollable
{
    if ([self.homeMainViewDelegate respondsToSelector:@selector(turnOffScrollviewScrollable)]) {
        [self.homeMainViewDelegate turnOffScrollviewScrollable];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
@implementation HomeFriendsTableView
@synthesize homeFriendsTableviewDelegate = homeFriendsTableviewDelegate;
-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.homeFriendsTableviewDelegate respondsToSelector:@selector(friendTableviewTouch)]) {
        [self.homeFriendsTableviewDelegate friendTableviewTouch];
    }
}

@end