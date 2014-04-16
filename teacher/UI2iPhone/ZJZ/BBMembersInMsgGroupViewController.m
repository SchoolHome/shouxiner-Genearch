//
//  BBMembersInMsgGroupViewController.m
//  teacher
//
//  Created by ZhangQing on 14-3-24.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBMembersInMsgGroupViewController.h"
#import "CPUIModelMessageGroupMember.h"
#import "CPUIModelUserInfo.h"
#import "BBMemberInMsgGroupTableViewCell.h"
#import "ContactsStartGroupChatViewController.h"
@interface BBMembersInMsgGroupViewController ()
@property (nonatomic , strong) UITableView *membersInMsgGroupTableview;
@property (nonatomic , strong) CPUIModelMessageGroup *msgGroup;
@end

@implementation BBMembersInMsgGroupViewController
@synthesize members = _members;
-(NSArray *)members
{
    if (!_members) {
        _members = [[NSArray alloc] init];
    }
    return _members;
}
-(void)setMembers:(NSArray *)members
{
    NSMutableArray *m = [[NSMutableArray alloc] init];
    CPLGModelAccount *account = [[CPSystemEngine sharedInstance] accountModel];
    NSNumber *uid = [NSNumber numberWithInteger:[account.uid integerValue]];
    for (CPUIModelMessageGroupMember *member in members) {
        if (![[uid stringValue] isEqualToString:member.userName]) {
            [m addObject:member];
        }
    }
    _members = m;
    [self.membersInMsgGroupTableview reloadData];
}
-(void)setMembers:(NSArray *)members andMsgGroup:(CPUIModelMessageGroup *)messageGroup
{
    self.msgGroup = messageGroup;
    [self setMembers:members];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ZJZAdd"] style:UIBarButtonItemStyleDone target:self action:@selector(addMember)];
        UIButton *add = [UIButton buttonWithType:UIButtonTypeCustom];
        [add setFrame:CGRectMake(0.f, 7.f, 30.f, 30.f)];
        [add setBackgroundImage:[UIImage imageNamed:@"ZJZAdd"] forState:UIControlStateNormal];
        [add addTarget:self action:@selector(addMember) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:add];
        
        
        UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
        [back setFrame:CGRectMake(0.f, 7.f, 30.f, 30.f)];
        [back setBackgroundImage:[UIImage imageNamed:@"ZJZBack"] forState:UIControlStateNormal];
        [back addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (IOS7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.title = @"会话中的联系人";
    
    _membersInMsgGroupTableview = [[UITableView alloc] initWithFrame:CGRectMake(0.f, 0.f, 320.f, [UIScreen mainScreen].bounds.size.height-60.f) style:UITableViewStylePlain];
    _membersInMsgGroupTableview.delegate = self;
    _membersInMsgGroupTableview.dataSource = self;
    _membersInMsgGroupTableview.backgroundColor = [UIColor clearColor];
    _membersInMsgGroupTableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_membersInMsgGroupTableview];
    
    self.view.backgroundColor = [UIColor colorWithRed:242/255.f green:236/255.f blue:230/255.f alpha:1.f];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)addMember
{
    ContactsStartGroupChatViewController *contactsGroupChat = [[ContactsStartGroupChatViewController alloc] init];
    //[contactsGroupChat setAddMemberInExistMsgGroup:[NSMutableArray arrayWithArray:self.members]];
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for (CPUIModelMessageGroupMember *member in self.members) {
        if (member.userInfo != nil) {
            [tempArray addObject:member.userInfo];
        }
    }
    contactsGroupChat.msgGroup = self.msgGroup;
    [contactsGroupChat filterExistUserInfo:YES WithSelectedArray:tempArray];
    [self.navigationController pushViewController:contactsGroupChat animated:YES];
}
#pragma mark UItableviewDatasouce
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"membersInMsgGroupCell";
    BBMemberInMsgGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[BBMemberInMsgGroupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    CPUIModelMessageGroupMember *member = [self.members objectAtIndex:indexPath.row];
    [cell setUserInfo:member.userInfo];
    

    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.members.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}
#pragma mark UItableviewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
