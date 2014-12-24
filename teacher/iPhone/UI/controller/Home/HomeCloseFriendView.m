//
//  HomeCloseFriendView.m
//  iCouple
//
//  Created by qing zhang on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#define CGRect_Section_Frame    CGRectMake(0.f, 0.f, 320.f, 22.f)
#import "HomeCloseFriendView.h"

#define closeFriendTableviewTag 90010
#define imageviewTextTag 90012
#define btnBelowTableviewTag 90013
#define btnAboveTableviewTag 90014
#define imageviewBottomTextTag 90015
@implementation HomeCloseFriendView
@synthesize btnPeopleAndDelete = _btnPeopleAndDelete;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        
        //背景图上的字
        UIImageView *imageviewBGTitle = [[UIImageView alloc] initWithFrame:CGRectMake(60.f, 480-155, 395/2, 15.f)];
        [self addSubview:imageviewBGTitle];
        //[imageviewBGTitle setImage:[UIImage imageNamed:@"item_txt_join_1.png"]];


        [self.imageviewUpPart setImage:[UIImage imageNamed:@"pic_goodfirend.jpg"]];
        
        
        HomeCloseFriendTableView *tableview = [[HomeCloseFriendTableView alloc] initWithFrame:CGRectMake(0.f, tableviewYbeginPoint+1, 320, 460-tableviewYbeginPoint) style:UITableViewStylePlain];
//        UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0.f, tableviewYbeginPoint+1, 320, 460-tableviewYbeginPoint) style:UITableViewStylePlain];
        tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableview.delegate   = self;
        tableview.dataSource = self;
        tableview.homeCloseFriendTableviewDelegate = self;
        tableview.showsVerticalScrollIndicator = NO;
        tableview.backgroundColor = [UIColor clearColor];
        tableview.tag = closeFriendTableviewTag;

//        UITapGestureRecognizer *tapInTableview = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInTableview:)];
//        [tableview addGestureRecognizer:tapInTableview];
        
        //如果是密友界面，加入白线//self.homeCloseSectionMutableArray.count*(50+92*2)
        UIImageView *imageviewTabkeviewLeftLine = [[UIImageView alloc] initWithFrame:CGRectMake(16.f, -9, 2.f, self.imageviewForTableViewBG.frame.size.height+9.f)];
        [imageviewTabkeviewLeftLine setImage:[UIImage imageNamed:@"line_friends_left"]];
        [self.imageviewForTableViewBG addSubview:imageviewTabkeviewLeftLine];
        self.tableviewDownPart  = tableview;
        [self addSubview:tableview];

        
//        self.btnPeopleAndDelete = [UIButton buttonWithType:UIButtonTypeCustom];
//        [self.btnPeopleAndDelete setFrame:CGRectMake(320.f-60.f, 0.f, 60.f, 60.f)];
//        [self.btnPeopleAndDelete setBackgroundImage:[UIImage imageNamed:@"btn_people.png"] forState:UIControlStateNormal];
//        [self.btnPeopleAndDelete setBackgroundImage:[UIImage imageNamed:@"btn_people_press.png"] forState:UIControlStateHighlighted];
//        [self.btnPeopleAndDelete addTarget:self action:@selector(btn_ToGoPeople:) forControlEvents:UIControlEventTouchUpInside];
//        self.btnPeopleAndDelete.tag = 90003;
//        [self addSubview:self.btnPeopleAndDelete];
        

    }
    return self;
}
-(void)tapInTableview:(UITapGestureRecognizer *)gesture
{
    if ([HomeInfo shareObject].isDeletingInCloseFriendCell && gesture.state == UIGestureRecognizerStateEnded) {
        [self beignChangeDeleteStatusFromCloseFriend:NO];
    }
}
-(void)recoverDeletingStatus
{
    [HomeInfo shareObject].isDeletingInCloseFriendCell = NO;
    [[HomeInfo shareObject] setStatusOffInCloseFriend];

    UITableView *tablebiew = (UITableView *)[self viewWithTag:closeFriendTableviewTag];

    [tablebiew reloadData];
}
- (void)btn_ToGoPeople:(UIButton *)sender
{
    switch (sender.tag) {
        case 90003:
        {
            [self.homeMainViewDelegate goPeopleController];
        }
            break;
        case 90004:
        {
            [self beignChangeDeleteStatusFromCloseFriend:NO];
        }
            break;            
        default:
            break;
    }
}
//进入破冰
-(void)beginBreakIcePageView
{
//    UIImageView *imageviewText = (UIImageView *)[self viewWithTag:imageviewTextTag];
//    if (!imageviewText) {
//        imageviewText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"item_close_Ice-breaking.jpg"]];
//        [imageviewText setFrame:CGRectMake(46.f, 277.f, 234.f, 49.f)];
//        imageviewText.tag = imageviewTextTag;
//        //[self addSubview:imageviewText];
//        [self insertSubview:imageviewText belowSubview:[self viewWithTag:closeFriendTableviewTag]];
//    }
//    
//    UIButton *btnBelowTableview = (UIButton *)[self viewWithTag:btnBelowTableviewTag];
//    if (!btnBelowTableview) {
//        btnBelowTableview = [UIButton buttonWithType:UIButtonTypeCustom];
//        btnBelowTableview.tag = btnBelowTableviewTag;
//        [btnBelowTableview setFrame:CGRectMake(40.f, 351.f, 240, 37.f)];
//        UIImage *imageNormal1 = [UIImage imageNamed:@"btn_im_warning.png"];
//        UIImage *imageNormal = [imageNormal1 stretchableImageWithLeftCapWidth:imageNormal1.size.width/2 topCapHeight:0];
//        
//        UIImage *imagePress1 = [UIImage imageNamed:@"btn_im_warningpress.png"];
//        UIImage *imagePress = [imagePress1 stretchableImageWithLeftCapWidth:imagePress1.size.width/2 topCapHeight:0];
//        [btnBelowTableview setBackgroundImage:imageNormal forState:UIControlStateNormal];
//        [btnBelowTableview setBackgroundImage:imagePress forState:UIControlStateHighlighted];
//        [btnBelowTableview setTitle:@"陪你疯陪你醉的他们都在哪呢?" forState:UIControlStateNormal];
//        [btnBelowTableview setTitle:@"陪你疯陪你醉的他们都在哪呢?" forState:UIControlStateHighlighted];
//        [btnBelowTableview setTitleEdgeInsets:UIEdgeInsetsMake(5.f, 5.f, 5.f, 5.f)];
//        btnBelowTableview.titleLabel.font = [UIFont systemFontOfSize:14.f];
//        [btnBelowTableview setHidden:YES];
//        //[self addSubview:btnBelowTableview];
//        [self insertSubview:btnBelowTableview belowSubview:[self viewWithTag:closeFriendTableviewTag]];
//    }
    UIButton *btnAboveTableview = (UIButton *)[self viewWithTag:btnAboveTableviewTag];
    if (!btnAboveTableview) {
        UIButton *btnAboveTableview = [UIButton buttonWithType:UIButtonTypeCustom];
        btnAboveTableview.tag = btnAboveTableviewTag;
        [btnAboveTableview setFrame:CGRectMake(0.f, 400.f, 320, 60.f)];
        btnAboveTableview.titleLabel.font = [UIFont systemFontOfSize:14.f];
        UIImage *AboveimageNormal1 = [UIImage imageNamed:@"pb_bar_closefriend.png"];
        //UIImage *AboveimageNormal = [AboveimageNormal1 stretchableImageWithLeftCapWidth:AboveimageNormal1.size.width/2 topCapHeight:0];
        UIImage *AboveimagePress1 = [UIImage imageNamed:@"pb_bar_closefriend_press.png"];
        //UIImage *AboveimagePress = [AboveimagePress1 stretchableImageWithLeftCapWidth:AboveimagePress1.size.width/2 topCapHeight:0];
        [btnAboveTableview setBackgroundImage:AboveimageNormal1 forState:UIControlStateNormal];
        [btnAboveTableview setBackgroundImage:AboveimagePress1 forState:UIControlStateHighlighted];
//        [btnAboveTableview setTitle:@"陪你疯陪你醉的他们都在哪呢?" forState:UIControlStateNormal];
//        [btnAboveTableview setTitle:@"陪你疯陪你醉的他们都在哪呢?" forState:UIControlStateHighlighted];
//        [btnAboveTableview setTitleEdgeInsets:UIEdgeInsetsMake(5.f, 5.f, 5.f, 5.f)];
        //[btnAboveTableview addTarget:self action:@selector(btnAboveTableviewPressDown) forControlEvents:UIControlEventTouchDown];
        [btnAboveTableview addTarget:self action:@selector(btnAboveTableviewPressUp) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnAboveTableview];
        [self insertSubview:btnAboveTableview aboveSubview:[self viewWithTag:closeFriendTableviewTag]];
    }
}
-(void)btnAboveTableviewPressDown
{
    UIButton *btn = (UIButton *)[self viewWithTag:btnBelowTableviewTag];
    
    btn.highlighted = YES;
}
-(void)btnAboveTableviewPressUp
{
//    UIButton *btn = (UIButton *)[self viewWithTag:btnBelowTableviewTag];
//    btn.highlighted = NO;
    
    if ([self.homeMainViewDelegate respondsToSelector:@selector(turnToCloseFriendView)]) {
        [self.homeMainViewDelegate turnToCloseFriendView];
    }
}
//退出破冰
-(void)endBreakIcePageView
{
    if ([self viewWithTag:imageviewTextTag]) {
        [[self viewWithTag:imageviewTextTag] removeFromSuperview];
    }
    if ([self viewWithTag:btnAboveTableviewTag]) {
        [[self viewWithTag:btnAboveTableviewTag] removeFromSuperview];
    }
    if ([self viewWithTag:btnBelowTableviewTag]) {
        [[self viewWithTag:btnBelowTableviewTag] removeFromSuperview];
    }
    if ([self viewWithTag:imageviewBottomTextTag]) {
        [[self viewWithTag:imageviewBottomTextTag] removeFromSuperview];
    }
}
/*
- (void)scaleImageviewByoffsetValue : (CGFloat)offsetValue
{
    [super scaleImageviewByoffsetValue:offsetValue];
    if (offsetValue == 0) {
        if ([self viewWithTag:btnBelowTableviewTag]) {
            [self viewWithTag:btnBelowTableviewTag].hidden = YES;
        }
        if ([self viewWithTag:btnAboveTableviewTag]) {
            [self viewWithTag:btnAboveTableviewTag].hidden = NO;
        }
    }else {
        if ([self viewWithTag:btnBelowTableviewTag]) {
            [self viewWithTag:btnBelowTableviewTag].hidden = NO;
        }
        if ([self viewWithTag:btnAboveTableviewTag]) {
            [[self viewWithTag:btnAboveTableviewTag] setHidden:YES];
        }  
    }
    
}
 */
#pragma mark tableviewDelegate && datasouce
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
#warning 优化时需要修改的地方，改为yes开启优化，目前还未完善
    closeFriendViewNotNeedRefreshData = NO;
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
    closeFriendViewNotNeedRefreshData = NO;
    
    if ([HomeInfo shareObject].closeFriendDataNeedRefresh) {
        HomeCloseFriendTableView *tableview = (HomeCloseFriendTableView *)[self viewWithTag:closeFriendTableviewTag];
        [tableview reloadData];
        [HomeInfo shareObject].closeFriendDataNeedRefresh = NO;
    }
    
    isScrolling = NO;
    if ([self.homeMainViewDelegate respondsToSelector:@selector(turnOnScrollviewScrollable)]) {
        [self.homeMainViewDelegate turnOnScrollviewScrollable];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    static NSString *cellIdentifier = @"closeFriendcell";
    
    HomeCloseFriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[HomeCloseFriendTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];    
        cell.closeFriendDelegate = self;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    }else
    {
        if (closeFriendViewNotNeedRefreshData) {
            return cell;
        }
    }
    [cell setContent:indexPath messageGroup:[[HomeInfo shareObject].closeFriendMessageDictionary objectForKey:[[HomeInfo shareObject].homeCloseSectionMutableArray objectAtIndex:indexPath.section]]];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 82;        
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    NSMutableArray *rowsInSection = [[HomeInfo shareObject].closeFriendMessageDictionary objectForKey:[[HomeInfo shareObject].homeCloseSectionMutableArray objectAtIndex:section]];

    if (rowsInSection.count > 0 )
    {
        if (rowsInSection.count%4 == 0) {
            return rowsInSection.count/4;
        }else {
            return rowsInSection.count/4+1;            
        }
    }
        
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([HomeInfo shareObject].homeCloseSectionMutableArray.count > 0)    return [HomeInfo shareObject].homeCloseSectionMutableArray.count;
    return 0;

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 16.f;
}
//当密友界面时的section的view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    if (tableView.tag == closeFriendTableviewTag) {
        [view setFrame:CGRect_Section_Frame] ;
      //  view.backgroundColor = [UIColor colorWithRed:243/255.f green:238/255.f blue:229/255.f alpha:1.f];
        UIImageView *imageviewBG = [[UIImageView alloc] initWithFrame:CGRectMake(18.f, 0.f, 300.f, 16.f)];
        imageviewBG.backgroundColor = [UIColor colorWithRed:243/255.f green:238/255.f blue:229/255.f alpha:1.f];
        //[imageviewBG setFrame:view.frame];
        [view addSubview:imageviewBG];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(12.f, 5.f, 8.f, 8.f)];
        [imageview setImage:[UIImage imageNamed:@"item_timeline_dot.png"]];
        [view addSubview:imageview];
        
        
        UILabel *labelDate = [[UILabel alloc] initWithFrame:CGRectMake(27.f, 3.f, 100.f, 13.f)];
        labelDate.text = [[HomeInfo shareObject].homeCloseSectionMutableArray objectAtIndex:section];
        labelDate.backgroundColor = [UIColor clearColor];
        labelDate.font = [UIFont systemFontOfSize:13.f];
        labelDate.textColor = [UIColor colorWithRed:83/255.f green:81/255.f blue:79/255.f alpha:0.75f];
        labelDate.textAlignment = UITextAlignmentLeft;
        [view addSubview:labelDate];
    }
    return view;
}
#pragma mark HomeCloseFriendTableViewCellDelegate
-(void)beignChangeDeleteStatusFromCloseFriend:(BOOL)deleteOrRecorver
{
    if (deleteOrRecorver) {
        [HomeInfo shareObject].isDeletingInCloseFriendCell = YES;  
//        [self.btnPeopleAndDelete setBackgroundImage:[UIImage imageNamed:@"btn_nav_close.png"] forState:UIControlStateNormal];
//        [self.btnPeopleAndDelete setBackgroundImage:[UIImage imageNamed:@"btn_nav_close_hover.png"] forState:UIControlStateHighlighted];
//        [self.btnPeopleAndDelete setTag:90004];
    }else {
        [HomeInfo shareObject].isDeletingInCloseFriendCell = NO; 
//        [self.btnPeopleAndDelete setBackgroundImage:[UIImage imageNamed:@"btn_people.png"] forState:UIControlStateNormal];
//        [self.btnPeopleAndDelete setBackgroundImage:[UIImage imageNamed:@"btn_people_press.png"] forState:UIControlStateHighlighted];
//        self.btnPeopleAndDelete.tag = 90003;
        [[HomeInfo shareObject] setStatusOffInCloseFriend];
    }
    UITableView *tablebiew = (UITableView *)[self viewWithTag:closeFriendTableviewTag];
    [tablebiew reloadData];
    
//    for (int i = 0; i < [HomeInfo shareObject].homeCloseSectionMutableArray.count; i++) {
//        NSMutableArray *arrMessageGroupsInSection = [[HomeInfo shareObject].closeFriendMessageDictionary objectForKey:[[HomeInfo shareObject].homeCloseSectionMutableArray objectAtIndex:i]];
//        NSLog(@"arrRows==%@",arrMessageGroupsInSection);
//        for (int j = 0; j<arrMessageGroupsInSection.count/4+1; j++) {
//            NSIndexPath *indexpath = [NSIndexPath indexPathForRow:j inSection:i];
//            HomeCloseFriendTableViewCell *cell = (HomeCloseFriendTableViewCell *)[tablebiew cellForRowAtIndexPath:indexpath];
//            NSLog(@"cell.subviews==%@",cell.subviews);
//            for (int k = 1; k < 5; k++) {
//                UIButton *btnDel = (UIButton *)[cell viewWithTag:k];
//                if (btnDel) {
//                    if (deleteOrRecorver) {
//                    [btnDel setHidden:NO];                        
//                    }else {
//                    [btnDel setHidden:YES];    
//                    }
//                    
//                }
//
//            }
//        }
//    }
}
#pragma mark touchMethod
-(void)tableviewTouchBegan
{
    [self beignChangeDeleteStatusFromCloseFriend:NO];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self beignChangeDeleteStatusFromCloseFriend:NO];
    [super touchesBegan:touches withEvent:event];
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
@implementation HomeCloseFriendTableView
@synthesize homeCloseFriendTableviewDelegate = _homeCloseFriendTableviewDelegate;
-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.homeCloseFriendTableviewDelegate respondsToSelector:@selector(tableviewTouchBegan)]) {
        [self.homeCloseFriendTableviewDelegate tableviewTouchBegan];
    }
}

@end