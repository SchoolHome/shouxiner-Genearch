//
//  AllFriendsViewController.m
//  AllFriends_dev
//
//  Created by ming bright on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AllFriendsViewController.h"
#import "AllFriendsViewController+Data.h"

#import "ShuangShuangTeamViewController.h"
#import "SystemIMViewController.h"
#import "XiaoShuangIMViewController.h"

@implementation AllFriendsViewController
@synthesize deleteItem = _deleteItem;
@synthesize fromGroupModel = _fromGroupModel;



#pragma mark - Dealloc
-(void)dealloc{

}

#pragma mark - Observe
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    CPLogInfo(@"observeValueForKeyPath");
   
    if([keyPath isEqualToString:@"friendTag"]){

//        switch (defaultState) {
//            case ALL_FRIENDS_STATE_PROFILE:
//                //
//                [self fillDefaultData];
//                break;
//            case ALL_FRIENDS_STATE_CHAT:
//                //
//                [self fillFilterData];
//                break;  
//            default:
//                break;
//        }
//        [frendsTableView reloadData];
    }
    else if([keyPath isEqualToString:@"deleteFriendDic"]){   // 删除好友

        
        NSDictionary * deleteFriendDict = [CPUIModelManagement sharedInstance].deleteFriendDic;
        
        NSInteger deleteResCode = [[deleteFriendDict valueForKey:delete_friend_dic_res_code] integerValue];
        if(deleteResCode == RESPONSE_CODE_SUCESS){  // 成功删除
            return;
        }
        else{ // 删除失败
            NSString * deleteResDesc = [deleteFriendDict valueForKey:delete_friend_dic_res_desc];
            [[HPTopTipView shareInstance] showMessage:deleteResDesc];
        }
    }
    
    else if ([@"createMsgGroupTag" isEqualToString:keyPath]) // 创建群成功／失败 ，单人和多人会话创建成功
    {

        [loadingView close]; //关闭loading
        
        NSInteger resultCodeInt = [CPUIModelManagement sharedInstance].createMsgGroupTag;
        if(resultCodeInt == RESPONSE_CODE_SUCESS)   // 成功
        {
            CPUIModelMessageGroup *currMsgGroup = [[CPUIModelManagement sharedInstance] userMsgGroup];
            if ([currMsgGroup isMsgMultiGroup]) {   // 群
                MutilIMViewController *mutil = [[MutilIMViewController alloc] init:currMsgGroup];
                [self.navigationController pushViewController:mutil animated:YES];
                return;
            }
            
            if ([currMsgGroup.relationType integerValue]==MSG_GROUP_UI_RELATION_TYPE_COUPLE)   // couple
            {
                SingleIMViewController *single = [[SingleIMViewController alloc] init:[CPUIModelManagement sharedInstance].coupleMsgGroup];
                [self.navigationController pushViewController:single animated:YES];
                return;
            }
            else  
            {
               CPUIModelMessageGroupMember *member = [currMsgGroup.memberList objectAtIndex:0]; //只有一个成员
                switch ([member.userInfo.type intValue]) {
                    case USER_MANAGER_FANXER:  // 凡想团队
                    {
                        ShuangShuangTeamViewController *team = [[ShuangShuangTeamViewController alloc] init:currMsgGroup];
                        [self.navigationController pushViewController:team animated:YES];
                    }
                        break;
                    case USER_MANAGER_SYSTEM:  // 系统消息
                    {
                        SystemIMViewController *system = [[SystemIMViewController alloc] init:currMsgGroup];
                        [self.navigationController pushViewController:system animated:YES];
                    }
                        break;
                    case USER_MANAGER_XIAOSHUANG: // 小双
                    {
                        XiaoShuangIMViewController *xiaoshuang = [[XiaoShuangIMViewController alloc] init:currMsgGroup];
                        [self.navigationController pushViewController:xiaoshuang animated:YES];
                    }
                        break;
                        
                    default:
                    {
                        SingleIMViewController *single = [[SingleIMViewController alloc] init:currMsgGroup];
                        [self.navigationController pushViewController:single animated:YES];
                    }
                        break;
                }

                return;
            }
        }
        else{        // 失败
            NSString * resultString = [CPUIModelManagement sharedInstance].createMsgGroupDesc;
            [[HPTopTipView shareInstance] showMessage:resultString];
        }
    }
    else if ([@"addGroupMemDic" isEqualToString:keyPath]){   // 添加群成员
        [self.navigationController popViewControllerAnimated:YES];
        [loadingView close];
    }
    else if([@"userMsgGroupListTag" isEqualToString:keyPath]) { // 删除群和群变化,（删除好友也会走到这里）

        switch (defaultState) {
            case ALL_FRIENDS_STATE_PROFILE:
                //
                [self fillDefaultData];
                
                BOOL deleteMode = NO;
                
                for (NSString *key in [[AFHeadStateManager sharedManager] allKeys]) {   
                    AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:key];
                    ////// 

                    if([temp.modelID hasPrefix:kAFHeadStatePrefixUser]||[temp.modelID hasPrefix:kAFHeadStatePrefixGroup]){

                        if (temp.showDelete) {
                            deleteMode = YES;    //主动删除好友
                            break;
                        }
                    }
                }
                if (deleteMode) { // 如果是删除状态下
                    [self fillDefaultState];
                    for (NSString *key in [[AFHeadStateManager sharedManager] allKeys]) {   
                        AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:key];
                        ////// 
                        
                        if ([temp.modelID hasPrefix:kAFHeadStatePrefixSystem]) {  // 系统角色
                        }else if([temp.modelID hasPrefix:kAFHeadStatePrefixUser]||[temp.modelID hasPrefix:kAFHeadStatePrefixGroup]){
                            temp.showDelete = YES;
                        }
                        [[AFHeadStateManager sharedManager] addState:temp];
                    }
                }else {
                    [self fillDefaultState];
                }
                break;
            case ALL_FRIENDS_STATE_CHAT:
                //
                [self fillFilterData];
                [self fillFilterState:self.fromGroupModel.memberList];
                break;  
            default:
                break;
        }
        [frendsTableView reloadData];
        
    }

}



#pragma mark - Setup

-(void)setup{
    
    fullFriendArray= [[NSMutableArray alloc] init];
    
    _headerArray = [[NSMutableArray alloc] init];
    _sweetArray = [[NSMutableArray alloc] init];
    _friendArray = [[NSMutableArray alloc] init];
    _groupArray = [[NSMutableArray alloc] init];
    
    searchedHeaderArray = [[NSMutableArray alloc] init];
    searchedFriendArray = [[NSMutableArray alloc] init];
    searchedSweetArray = [[NSMutableArray alloc] init];
    searchedGroupArray = [[NSMutableArray alloc] init];
    
    resultArray = [[NSMutableArray alloc] init];
    


    
}

#pragma mark - Init

-(id)initWithState:(ALL_FRIENDS_STATE) state_ group:(CPUIModelMessageGroup *)group_{
    
    self = [super init];
    if (self) {
        //
        
        [self setup];
        defaultState = state_;
        
        navBar = [[AFNavgationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        [self.view addSubview:navBar];
        
        [navBar.backButton addTarget:self action:@selector(barBackTaped:) forControlEvents:UIControlEventTouchUpInside];
        [navBar.cancelButton addTarget:self action:@selector(barCancelTaped:) forControlEvents:UIControlEventTouchUpInside];
        [navBar.convertButton addTarget:self action:@selector(barConvertTaped:) forControlEvents:UIControlEventTouchUpInside];
        [navBar.chatButton addTarget:self action:@selector(barChatTaped:) forControlEvents:UIControlEventTouchUpInside];
        
        switch (state_) {
            case ALL_FRIENDS_STATE_PROFILE:
                //
            {
                navBar.backButton.hidden = NO;
                navBar.cancelButton.hidden = YES;
                navBar.convertButton.hidden = NO;
                navBar.chatButton.hidden = YES;

                [self fillDefaultData];
                [self fillDefaultState];
            }

                break;
            case ALL_FRIENDS_STATE_CHAT:
                //
            {
                navBar.backButton.hidden = YES;
                navBar.cancelButton.hidden = NO;
                navBar.convertButton.hidden = YES;
                navBar.chatButton.hidden = NO;
                
                navBar.chatButton.enabled = NO;
                
                
                self.fromGroupModel = group_;
                
                NSString *chatTitle = @"开始聊";
                if ([group_.memberList count]>0) {
                    
                    int count = 0;
                    for (CPUIModelMessageGroupMember *member in group_.memberList) {
                        if (![member isHiddenMember]) {   // 排除隐藏的成员
                            count = count +1;
                        }
                    }
                    chatTitle = [NSString stringWithFormat:@"开始聊(%d)",count];
                }
                
                [navBar.chatButton setTitle:chatTitle forState:UIControlStateNormal];
                [self fillFilterData];
                [self fillFilterState:group_.memberList];
                
                
            }
                break;
            default:
                break;
        }

    }
    return self;
}

#pragma mark - NavgationBar button actions

-(void)barBackTaped:(id)sender{
    [frendsSearchBar resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)barCancelTaped:(id)sender{
    [frendsSearchBar resignFirstResponder];
    
    switch (defaultState) {
        case ALL_FRIENDS_STATE_PROFILE:
        {
            navBar.backButton.hidden = NO;
            navBar.cancelButton.hidden = YES;
            
            navBar.convertButton.hidden = NO;
            navBar.chatButton.hidden = YES;
            
            // 修改状态
            
            for (NSString *key in [[AFHeadStateManager sharedManager] allKeys]) {   
                AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:key];
                temp.enabled = YES;
                temp.isSelectedMode = NO;
                temp.canModifyselected = YES;
                temp.selected = -1;
                temp.showDelete = NO;
                
                [[AFHeadStateManager sharedManager] addState:temp];
                
                // 排除群聊已经被选中的
                // TODO:
                
            }
            
            [frendsTableView reloadData];
        }
            break;
        case ALL_FRIENDS_STATE_CHAT:
            //
        {
            CPLogInfo(@"go back");
            [self.navigationController popViewControllerAnimated:YES];
        }
            break; 
        default:
            break;
    }
}

-(void)barConvertTaped:(id)sender{
    [frendsSearchBar resignFirstResponder];
    
    navBar.backButton.hidden = YES;
    navBar.cancelButton.hidden = NO;
    
    navBar.convertButton.hidden = YES;
    navBar.chatButton.hidden = NO;
    
    navBar.chatButton.enabled = NO;
    [navBar.chatButton setTitle:@"开始聊" forState:UIControlStateNormal];
    // 修改状态
    
    for (NSString *key in [[AFHeadStateManager sharedManager] allKeys]) {   
        AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:key];
        temp.enabled = YES;
        temp.isSelectedMode = YES;
        temp.canModifyselected = YES;
        temp.selected = 0;
        temp.showDelete = NO;
        
        [[AFHeadStateManager sharedManager] addState:temp];
    }
    
    [frendsTableView reloadData];
}

-(void)closeLoadingView{
    if (loadingView!=nil&&!loadingView.isClose) {
        [loadingView close];
    }
}

-(void)barChatTaped:(id)sender{
    
    /*
     * 1,选一个人
     * 2,选N个人
     * 3,选一个群
     * 4,群＋N个人
     */
    [frendsSearchBar resignFirstResponder];
    
    CustomAlertView *alert = [[CustomAlertView alloc] init];
    loadingView = [alert showLoadingMessageBox:@"准备聊天"];
    
    // 15秒没有收到返回，自动消失，避免一直没有返回的情况下，程序不可用
    [self performSelector:@selector(closeLoadingView) withObject:nil afterDelay:15];
    
    if (1 == [[[AFHeadStateManager sharedManager] allSelectedStates] count]) {
        AFHeadState *state = [[[AFHeadStateManager sharedManager] allSelectedStates] objectAtIndex:0];
        if ([state.modelID hasPrefix:kAFHeadStatePrefixGroup]) { // 选一个群
            
            for (CPUIModelMessageGroup *groupModel in _groupArray) {
                //NSString *groupModelID = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixGroup,[groupModel.msgGroupID intValue]];
                NSString *suffix = [NSString stringWithFormat:@"%d",[groupModel.msgGroupID intValue]];
                
                NSString *selectedMsgGroupID = [[state.modelID componentsSeparatedByString:@"_"] lastObject];
                
                //if ([state.modelID hasSuffix:suffix]) {
                if ([suffix isEqualToString:selectedMsgGroupID]) {
                    
                    //
                    [[CPUIModelManagement sharedInstance] createConversationWithUsers:nil andMsgGroups:[NSArray arrayWithObject:groupModel] andType:CREATE_CONVER_TYPE_CLOSED];
                    
                    return;
                }
            }
 
        }else {  // 选一个人
            
            
            if (self.fromGroupModel!=nil) { //群里面只有自己,只选一个人
                NSMutableArray *users = [[NSMutableArray alloc] init];
                
                for (CPUIModelUserInfo *userInfo in fullFriendArray) {
                    NSString *modelID = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixUser,[userInfo.userInfoID intValue]];
                    
                    AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:modelID];
                    
                    if (1==temp.selected&&temp.canModifyselected) {   // 被选中 ＋ 可以取消选择 ＝ 新选的人
                        [users addObject:userInfo];
                    }
                }
                
                [[CPUIModelManagement sharedInstance] addGroupMemWithUserNames:users andGroup:self.fromGroupModel];
                return;
                
            }else{
                for (CPUIModelUserInfo *userInfo in fullFriendArray) {
                    NSString *suffix = [NSString stringWithFormat:@"%d",[userInfo.userInfoID intValue]];
                    
                    NSString *selectedUserInfoID = [[state.modelID componentsSeparatedByString:@"_"] lastObject];
                    //if ([state.modelID hasSuffix:suffix]) {
                    if ([suffix isEqualToString:selectedUserInfoID]) {
                        if ([[CPUIModelManagement sharedInstance].coupleModel.userInfoID isEqualToNumber:userInfo.userInfoID]) {  //couple 直接进去
                            SingleIMViewController *single = [[SingleIMViewController alloc] init:[CPUIModelManagement sharedInstance].coupleMsgGroup];
                            [self.navigationController pushViewController:single animated:YES];
                            [loadingView close];
                            return;
                        }
                        
                        
                        [[CPUIModelManagement sharedInstance] createConversationWithUsers:[NSArray arrayWithObject:userInfo] andMsgGroups:nil andType:CREATE_CONVER_TYPE_CLOSED];
                        
                        return;
                    }
                }
            }
        }
    }else {
        //
        
        if (self.fromGroupModel!=nil) {  // 群＋N个人
            
            NSMutableArray *users = [[NSMutableArray alloc] init];
            
            for (CPUIModelUserInfo *userInfo in fullFriendArray) {
                NSString *modelID = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixUser,[userInfo.userInfoID intValue]];
                
                AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:modelID];
                
                if (1==temp.selected&&temp.canModifyselected) {   // 被选中 ＋ 可以取消选择 ＝ 新选的人
                    [users addObject:userInfo];
                }
            }
            
            [[CPUIModelManagement sharedInstance] addGroupMemWithUserNames:users andGroup:self.fromGroupModel];
            
            return;
            
        }else {  //选N个人,只能是普通人
            //
            
            NSMutableArray *users = [[NSMutableArray alloc] init];
            
            for (CPUIModelUserInfo *userInfo in fullFriendArray) {
                NSString *modelID = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixUser,[userInfo.userInfoID intValue]];
                
                AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:modelID];
                
                if (1==temp.selected&&temp.canModifyselected) {  
                    
                    [users addObject:userInfo];
                }
            }

            [[CPUIModelManagement sharedInstance] createConversationWithUsers:users andMsgGroups:nil andType:CREATE_CONVER_TYPE_CLOSED];
            
            return;
        }
    }
    
    

}


#pragma mark - NSNotification

-(void)headItemDeleteTapsNotification:(NSNotification *) note{
    
    if([[CPUIModelManagement sharedInstance] canConnectToNetwork]){
        NSInteger sysOnCode = [CPUIModelManagement sharedInstance].sysOnlineStatus;
        if(sysOnCode == 1){
            
            self.deleteItem = (AFHeadItem *)[note object];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil 
                                                            message:@"删除后无法恢复聊天纪录,是否确认删除?" 
                                                           delegate:self 
                                                  cancelButtonTitle:nil 
                                                  otherButtonTitles:@"确定",@"取消", nil];
            [alert show];
        }else{
            [[HPTopTipView shareInstance] showMessage:@"用户还没有登录"];
        }
    }else{

        [[HPTopTipView shareInstance] showMessage:@"联网失败,请检查网络"];
    }

}

-(void)headItemLongPressNotification:(NSNotification *) note{
    
    CPLogInfo(@"%@",[note object]);
    AFHeadItem *item = [note object];
    
    AFHeadState *state = item.headState;
    if (state.isSelectedMode) {    // 当前是选人状态,不让删除
        
    }else {    // 当前是查看profile状态，可以删除
        for (NSString *key in [[AFHeadStateManager sharedManager] allKeys]) {   
            AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:key];
            
            if ([temp.modelID hasPrefix:kAFHeadStatePrefixSystem]) {  // 系统角色
            }else if([temp.modelID hasPrefix:kAFHeadStatePrefixUser]||[temp.modelID hasPrefix:kAFHeadStatePrefixGroup]){
                temp.showDelete = YES;
            }
            [[AFHeadStateManager sharedManager] addState:temp];
        }
        [frendsTableView reloadData];
        
        // 显示取消删除
        navBar.backButton.hidden = YES;
        navBar.cancelButton.hidden = NO;
        
    }
}

-(void)headItemTapNotification:(NSNotification *) note{
    
    CPLogInfo(@"%@",[note object]);
    
    AFHeadItem *item = [note object];
    AFHeadState *state = item.headState;
    
    CPLogInfo(@"item.headState.selected ====== %d",item.headState.selected);
    
    // 互斥逻辑运算和状态控制
    [self filterLogic:item];
    
    // 按钮状态
    if ([[[AFHeadStateManager sharedManager] allSelectedStates] count]>0) {
        
        if ([state.modelID hasPrefix:kAFHeadStatePrefixGroup]){ // 选中群角色
            
            
            if ([item.headItemData isKindOfClass:[CPUIModelMessageGroup class]]) { // 
                CPUIModelMessageGroup *group = (CPUIModelMessageGroup *)item.headItemData;
                navBar.chatButton.enabled = YES;
                NSString *chatTitle = [NSString stringWithFormat:@"开始聊(%d)",[group.memberList count]];
                [navBar.chatButton setTitle:chatTitle forState:UIControlStateNormal];
            }
            
            return;
        }
        
        
        navBar.chatButton.enabled = YES;
        
        int strangerCount = 0;  // 群内陌生人的数量
        if ([self.fromGroupModel.memberList count]>0) {
            for (CPUIModelMessageGroupMember *member in self.fromGroupModel.memberList) {
                if (![member isHiddenMember]) {   // 排除隐藏的成员
                    if (!member.userInfo) {    // 是陌生人
                        strangerCount = strangerCount +1;
                    }
                }
            }
        }
        
        if (self.fromGroupModel) {
            
            int count = 0;
            for (CPUIModelMessageGroupMember *member in self.fromGroupModel.memberList) {
                if (![member isHiddenMember]) {   // 排除隐藏的成员
                    count = count +1;
                }
            }

            if ([[[AFHeadStateManager sharedManager] allSelectedStates] count]+strangerCount<=count) {   //所有被选中的 ＋ 陌生人 <= 原有的人
                //
                navBar.chatButton.enabled = NO;   // 没选中更多的人，按钮不可用
            }
        }
        
        NSString *chatTitle = [NSString stringWithFormat:@"开始聊(%d)",[[[AFHeadStateManager sharedManager] allSelectedStates] count]+strangerCount];
        [navBar.chatButton setTitle:chatTitle forState:UIControlStateNormal];

    }else {
        navBar.chatButton.enabled = NO;
        [navBar.chatButton setTitle:@"开始聊" forState:UIControlStateNormal];
    }
}

#pragma mark - UIViewController Delegate

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];

    frendsSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 44, 320, 44)];
    [[frendsSearchBar.subviews objectAtIndex:0] removeFromSuperview];
    UIImageView *searchBarImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list_bg.png"]];
    [frendsSearchBar insertSubview:searchBarImg atIndex:0];
    
    frendsSearchBar.delegate = self;
    [self.view addSubview:frendsSearchBar];
    
    frendsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44+44, 320, 460-44-44)
                                                   style:UITableViewStylePlain];
    frendsTableView.dataSource = self;
    frendsTableView.delegate = self;
    frendsTableView.separatorColor = [UIColor clearColor];
    
    [self.view addSubview:frendsTableView];
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    // kAFHeadItemTapNotification
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(headItemTapNotification:) 
                                                 name:kAFHeadItemTapNotification 
                                               object:nil];
    
    // kAFHeadItemLongPressNotification
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(headItemLongPressNotification:) 
                                                 name:kAFHeadItemLongPressNotification 
                                               object:nil];
    
    // kAFHeadItemDeleteTapNotification
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(headItemDeleteTapsNotification:) 
                                                 name:kAFHeadItemDeleteTapNotification 
                                               object:nil];
    
    
    // 好友／蜜友列表
    [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"friendTag" options:0 context:@"friendTag"];
    // 群列表
    [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"userMsgGroupListTag" options:0 context:@"userMsgGroupListTag"];
    // 删除好友监听
    [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"deleteFriendDic" options:0 context:@"deleteFriendDic"];
    // 创建群组监听
    [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"createMsgGroupTag" options:0 context:@"createMsgGroupTag"];
    // 添加群组监听
    [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"addGroupMemDic" options:0 context:@"addGroupMemDic"];
    
    
    // profile返回时刷新
    switch (defaultState) {
        case ALL_FRIENDS_STATE_PROFILE:
            //
        {
            navBar.backButton.hidden = NO;
            navBar.cancelButton.hidden = YES;
            navBar.convertButton.hidden = NO;
            navBar.chatButton.hidden = YES;
            
            [self fillDefaultData];
            [self fillDefaultState];
        }
            
            break;
        case ALL_FRIENDS_STATE_CHAT:
            //
        {
            navBar.backButton.hidden = YES;
            navBar.cancelButton.hidden = NO;
            navBar.convertButton.hidden = YES;
            navBar.chatButton.hidden = NO;
            
            navBar.chatButton.enabled = NO;
            
            NSString *chatTitle = @"开始聊";
            if ([self.fromGroupModel.memberList count]>0) {
                
                int count = 0;
                for (CPUIModelMessageGroupMember *member in self.fromGroupModel.memberList) {
                    if (![member isHiddenMember]) {   // 排除隐藏的成员
                        count = count +1;
                    }
                }
                
                chatTitle = [NSString stringWithFormat:@"开始聊(%d)",count];
            }
            
            [navBar.chatButton setTitle:chatTitle forState:UIControlStateNormal];
            [self fillFilterData];
            [self fillFilterState:self.fromGroupModel.memberList];
            
            
        }
            break;
        default:
            break;
    }
    [frendsTableView reloadData];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    // 避免出现2个实例的时候，监听还在，造成一个方法多次调用
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kAFHeadItemLongPressNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kAFHeadItemTapNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kAFHeadItemDeleteTapNotification object:nil];
    
    [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"friendTag"];   // 删除人的时候
    [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"userMsgGroupListTag"];
    
    [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"deleteFriendDic"];  
    [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"createMsgGroupTag"];
    [[CPUIModelManagement sharedInstance] removeObserver:self forKeyPath:@"addGroupMemDic"];  
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [resultArray count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    AFSectionData *data = [resultArray objectAtIndex:section];
    
    if ([data.sectionData count]%4 == 0) {
        return [data.sectionData count]/4;
    }else {
        return [data.sectionData count]/4 + 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    AFSectionData *data = [resultArray objectAtIndex:section];
    if ([data.sectionTitle isEqualToString:@""]) {  // 系统
        return 0;
    }
    return 23.5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    AFSectionData *data = [resultArray objectAtIndex:section];
    if ([data.sectionTitle isEqualToString:@""]) {
        return nil;
    }else {
        return [AFSectionHeaderView headerViewWith:[NSString stringWithFormat:@" %@",data.sectionTitle]];
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	AFTableViewCell *cell=nil;
	static NSString *kCell = @"cell";
	cell = (AFTableViewCell *)[tableView dequeueReusableCellWithIdentifier:kCell];
	if (cell == nil) {
		cell = (AFTableViewCell *)[[AFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCell];
        cell.delegate = self;
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
    
    cell.cellIndexPath = indexPath;
    
    AFSectionData *data = [resultArray objectAtIndex:indexPath.section];
    
    NSArray *friends = data.sectionData;
    
    if ((indexPath.row*4 + 4)<=[friends count]) {
        cell.cellData = [friends subarrayWithRange:NSMakeRange(indexPath.row*4, 4)];
    }else {
        cell.cellData = [friends subarrayWithRange:NSMakeRange(indexPath.row*4, ([friends count]- indexPath.row*4))];
    }
	return cell;
}



#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [frendsSearchBar resignFirstResponder];
}


#pragma mark - UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    //[frendsSearchBar setShowsCancelButton:YES animated:YES];
    return YES;
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    return YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    //[frendsSearchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if(searchText!=nil&&[searchText length]>0){
        if([[searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0){
            return;
        }
        [self searchWithSearchStr:searchText];
        [frendsTableView reloadData];
    }else{
        
        switch (defaultState) {
            case ALL_FRIENDS_STATE_PROFILE:
                [self fillDefaultData];
                break;
            case ALL_FRIENDS_STATE_CHAT:
                [self fillFilterData];
                break;
            default:
                break;
        }
        
        // 更新数据，保持所有状态
        [frendsTableView reloadData];
    }
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar{
    [frendsSearchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [frendsSearchBar resignFirstResponder];
    
    [self searchWithSearchStr:searchBar.text];
    [frendsTableView reloadData];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if( 0 == buttonIndex){
        
        id headData = self.deleteItem.headItemData;
        if ([headData isKindOfClass:[CPUIModelUserInfo class]]) { //个人
            
            NSString *name = ((CPUIModelUserInfo *)headData).name;
            [[CPUIModelManagement sharedInstance] deleteFriendRelationWithUserName:name]; 
            
        }else if ([headData isKindOfClass:[CPUIModelMessageGroup class]]){  // 群
            
            CPUIModelMessageGroup *groupModel = (CPUIModelMessageGroup *)headData;
            [[CPUIModelManagement sharedInstance] quitGroupWithGroup:groupModel];
            
        }
        
    }else {
        //
    }
}


@end
