//
//  ContactsViewController.m
//  teacher
//
//  Created by ZhangQing on 14-3-17.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "ContactsViewController.h"
#import "PalmUIManagement.h"
#import "HPTopTipView.h"
#import "ContactsModel.h"
#import "CPUIModelManagement.h"
#import "BBSingleIMViewController.h"
#import "ContactsStartGroupChatViewController.h"
//test
#import "BBMembersInMsgGroupViewController.h"
@interface ContactsViewController ()<UIAlertViewDelegate>
@property (nonatomic , strong) BBMessageGroupBaseTableView *contactsListTableview;
@property (nonatomic , strong) NSArray *contactsListDataArray;
@property (nonatomic , strong) UISearchBar *contactsTableSearchBar;
@property(nonatomic,strong) NSString *phoneNumber;
@end

@implementation ContactsViewController
@synthesize contactsListDataArray = _contactsListDataArray ;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIButton *btnGroupChat = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnGroupChat setFrame:CGRectMake(0.f, 7.f, 30.f, 30.f)];
        [btnGroupChat setBackgroundImage:[UIImage imageNamed:@"ZJZChat"] forState:UIControlStateNormal];
        [btnGroupChat addTarget:self action:@selector(groupChatMode) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnGroupChat];
        

        UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
        [back setFrame:CGRectMake(0.f, 7.f, 30.f, 30.f)];
        [back setBackgroundImage:[UIImage imageNamed:@"ZJZBack"] forState:UIControlStateNormal];
        [back addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];

    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"createMsgGroupTag" options:0 context:nil];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"createMsgGroupTag"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (IOS7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.title = @"通讯录";
    
    _contactsTableSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    _contactsTableSearchBar.placeholder = @"搜索";
    [self.view addSubview:_contactsTableSearchBar];
    _contactsTableSearchBar.delegate = self;
    
    _contactsListTableview = [[BBMessageGroupBaseTableView alloc] initWithFrame:CGRectMake(0.f, 40.f, 320.f, [UIScreen mainScreen].bounds.size.height-102.f ) style:UITableViewStylePlain];
    _contactsListTableview.backgroundColor = [UIColor clearColor];
    _contactsListTableview.delegate = self;
    _contactsListTableview.dataSource = self;
    _contactsListTableview.messageGroupBaseTableViewdelegate = self;
    _contactsListTableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_contactsListTableview];
    
    self.view.backgroundColor = [UIColor colorWithRed:242/255.f green:236/255.f blue:230/255.f alpha:1.f];
    //[[PalmUIManagement sharedInstance] getuserContacts];
	// Do any additional setup after loading the view.
    if (!IOS7) {
        for (UIView *subview in _contactsTableSearchBar.subviews)
        {
            if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
            {
                [subview removeFromSuperview];
                break;
            }
        }
        
        //[_messageListTableSearchBar setScopeBarBackgroundImage:[UIImage imageNamed:@"ZJZSearch"]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSMutableArray *)searchResultListByKeyWord:(NSString *)keyword
{
    NSMutableArray *tempSearchResult = [[NSMutableArray alloc] init];
    for (CPUIModelUserInfo *userInfo in [CPUIModelManagement sharedInstance].friendArray) {
            NSRange containStrRange = [userInfo.nickName rangeOfString:keyword options:NSCaseInsensitiveSearch];
            if (containStrRange.length > 0) {
                //有当前关键字结果
                [tempSearchResult addObject:userInfo];
            }else
            {
                //没有
            }

    }
    return tempSearchResult;
}
#pragma mark Getter&&Setter
-(NSArray *)contactsListDataArray
{
    if (!_contactsListDataArray) {
        _contactsListDataArray = [[NSArray alloc] initWithArray:[CPUIModelManagement sharedInstance].friendArray];
    }
    NSLog(@"%@",_contactsListDataArray);
    return _contactsListDataArray;
}

-(void)setContactsListDataArray:(NSArray *)contactsListDataArray
{
    _contactsListDataArray = [[NSArray alloc] initWithArray:contactsListDataArray];
    [self.contactsListTableview reloadData];
}

#pragma mark Observer
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{

    /*
     if (![[tempDic objectForKey:ASI_REQUEST_HAS_ERROR] boolValue]) {
     NSDictionary *tempJsonDic = [[tempDic objectForKey:ASI_REQUEST_DATA] objectForKey:@"list"];
     [self creatContactsData:tempJsonDic];
     }else
     {
     [[HPTopTipView shareInstance] showMessage:[tempDic objectForKey:ASI_REQUEST_ERROR_MESSAGE]];
     }
     */
    if ([keyPath isEqualToString:@"createMsgGroupTag"]) {
        NSInteger resultCodeInt = [CPUIModelManagement sharedInstance].createMsgGroupTag;
        // 成功
        if(resultCodeInt == RESPONSE_CODE_SUCESS){
            CPUIModelMessageGroup *currMsgGroup = [[CPUIModelManagement sharedInstance] userMsgGroup];
            BBSingleIMViewController *single = [[BBSingleIMViewController alloc] init:currMsgGroup];
            [self.navigationController pushViewController:single animated:YES];
        }else if (resultCodeInt == RESPONSE_CODE_ERROR) {
            NSString *errorStr = (NSString *)[[CPUIModelManagement sharedInstance].responseActionDic objectForKey:response_action_res_desc];
            CPLogInfo(@"%@",errorStr);
        }
    }
}
#pragma mark ContactsViewController
-(void)creatContactsData : (NSDictionary *)dic
{
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for (NSString *key in dic.allKeys) {
        ContactsModel *tempModel = [[ContactsModel alloc] init];
        tempModel.modelKey = key;
        NSDictionary *infoDic = [dic objectForKey:key];
        tempModel.avatarPath = [infoDic objectForKey:@"avatar"];
        tempModel.jid = [infoDic objectForKey:@"jid"];
        tempModel.mobile = [infoDic objectForKey:@"mobile"];
        tempModel.uid = [infoDic objectForKey:@"uid"];
        tempModel.userName = [infoDic objectForKey:@"username"];
        [tempArray addObject:tempModel];
    }
    
    [self setContactsListDataArray:tempArray];
}
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)groupChatMode
{
    ContactsStartGroupChatViewController *groupChat = [[ContactsStartGroupChatViewController alloc] init];
    [self.navigationController pushViewController:groupChat animated:YES];
    
//    BBMembersInMsgGroupViewController *member = [[BBMembersInMsgGroupViewController alloc] init];
//    [self.navigationController pushViewController:member animated:YES];
}
#pragma mark UITableviewDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if ([_contactsTableSearchBar isFirstResponder]) {
        [_contactsTableSearchBar resignFirstResponder];
    }
    
}

-(void)tableviewHadTapped
{
    if ([_contactsTableSearchBar isFirstResponder]) {
        [_contactsTableSearchBar resignFirstResponder];
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
#pragma mark UItableviewDatasouce
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.f;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectZero];
    sectionView.backgroundColor = [UIColor blackColor];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10.f, 6.f, 200.f, 20.f)];
    title.backgroundColor = [UIColor clearColor];
    title.font = [UIFont boldSystemFontOfSize:14.f];
    title.textColor = [UIColor whiteColor];
    title.text = @"手心网家长用户";
    [sectionView addSubview:title];
    return sectionView;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"手心网家长用户";
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contactsListDataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *contactsTableviewCellIdentifier = @"contactsTableviewCellIdentifier";
    ContactsTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:contactsTableviewCellIdentifier];
    if (!cell) {
        cell = [[ContactsTableviewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contactsTableviewCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    
    [cell setModel:[self.contactsListDataArray objectAtIndex:indexPath.row]];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}
#pragma mark ContactsTableviewCellDelegate
-(void)beginChat:(CPUIModelUserInfo *)model
{
    [[CPUIModelManagement sharedInstance] createConversationWithUsers:[NSArray arrayWithObject:model] andMsgGroups:nil andType:CREATE_CONVER_TYPE_COMMON];
}
-(void)sendMessage:(NSString *)mobileNumber
{
    if ([mobileNumber isEqualToString:@"0"]) {
        return;
    }
    
    NSString *mobileNumberUrlStr = [NSString stringWithFormat:@"sms://%@",mobileNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mobileNumberUrlStr]];
}
-(void)makeCall:(NSString *)mobileNumber
{
    if ([mobileNumber isEqualToString:@"0"]) {
        return;
    }
    self.phoneNumber = mobileNumber;
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"电话" message:[NSString stringWithFormat: @"确认拨打%@",mobileNumber] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
//    [alert show];
    NSString *mobileNumberUrlStr = [NSString stringWithFormat:@"telprompt://%@",mobileNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mobileNumberUrlStr]];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex != 0) {
//        NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",self.phoneNumber]];
//        UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
//        [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
        NSString *mobileNumberUrlStr = [NSString stringWithFormat:@"telprompt://%@",self.phoneNumber];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mobileNumberUrlStr]];
    }
}

#pragma mark SearchBarDelegate
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText isEqualToString:@""]) {
        self.contactsListDataArray = [[NSMutableArray alloc] initWithArray:[CPUIModelManagement sharedInstance].friendArray];
    }else
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSMutableArray *searchResult =  [self searchResultListByKeyWord:searchText];
            
            dispatch_async(dispatch_get_main_queue(),  ^{
                [self setContactsListDataArray:searchResult];
                
                
            });
        });
    }
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if ([_contactsTableSearchBar isFirstResponder]) {
        [_contactsTableSearchBar resignFirstResponder];
    }
}
@end
