//
//  AllFriendsViewController+Data.m
//  iCouple
//
//  Created by ming bright on 12-8-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AllFriendsViewController+Data.h"
#import "SingleIndependentProfileViewController.h"
#import "GroupIndependentProfileViewController.h"
@implementation AllFriendsViewController (Data)


-(void)fillDefaultState{
    ////////  组群
    for(CPUIModelMessageGroup *uiMsgGroup in [CPUIModelManagement sharedInstance].userMessageGroupList){
        if ([uiMsgGroup isMsgConverGroup]){

            AFHeadState *state = [[AFHeadState alloc] init];
            state.modelID = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixGroup,[uiMsgGroup.msgGroupID intValue]];
            state.enabled = YES;
            state.isSelectedMode = NO;
            state.canModifyselected = YES;
            state.selected = -1;
            state.showDelete = NO;
            
            [[AFHeadStateManager sharedManager] addState:state];
        }
    }
    
    /////// 好友
    for(CPUIModelUserInfo * modelUserInfo in fullFriendArray){
        int typeInt = modelUserInfo.type.integerValue;
        
        // 好友
        if(typeInt == USER_RELATION_TYPE_COMMON){

            
            AFHeadState *state = [[AFHeadState alloc] init];
            state.modelID = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixUser,[modelUserInfo.userInfoID intValue]];
            state.enabled = YES;
            state.isSelectedMode = NO;
            state.canModifyselected = YES;
            state.selected = -1;
            state.showDelete = NO;
            
            [[AFHeadStateManager sharedManager] addState:state];
        }
        
        // 蜜友
        else if(typeInt == USER_RELATION_TYPE_CLOSED){

            
            
            AFHeadState *state = [[AFHeadState alloc] init];
            state.modelID = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixUser,[modelUserInfo.userInfoID intValue]];
            state.enabled = YES;
            state.isSelectedMode = NO;
            state.canModifyselected = YES;
            state.selected = -1;
            state.showDelete = NO;
            
            [[AFHeadStateManager sharedManager] addState:state];
            
        }
        
        // 小双
        else if(typeInt == USER_MANAGER_XIAOSHUANG){

            
            AFHeadState *state = [[AFHeadState alloc] init];
            state.modelID = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixSystem,[modelUserInfo.userInfoID intValue]];
            state.enabled = YES;
            state.isSelectedMode = NO;
            state.canModifyselected = YES;
            state.selected = -1;
            state.showDelete = NO;
            
            [[AFHeadStateManager sharedManager] addState:state];
            
        }
        
        
        // 另一半
        else if(typeInt == USER_RELATION_TYPE_LOVER||typeInt == USER_RELATION_TYPE_COUPLE||typeInt == USER_RELATION_TYPE_MARRIED){

            
            AFHeadState *state = [[AFHeadState alloc] init];
            state.modelID = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixUser,[modelUserInfo.userInfoID intValue]];
            state.enabled = YES;
            state.isSelectedMode = NO;
            state.canModifyselected = YES;
            state.selected = -1;
            state.showDelete = NO;
            
            [[AFHeadStateManager sharedManager] addState:state];
            
        }
        
        // fanxer team
        else if(typeInt == USER_MANAGER_FANXER){

            
            AFHeadState *state = [[AFHeadState alloc] init];
            state.modelID = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixSystem,[modelUserInfo.userInfoID intValue]];
            state.enabled = YES;
            state.isSelectedMode = NO;
            state.canModifyselected = YES;
            state.selected = -1;
            state.showDelete = NO;
            
            [[AFHeadStateManager sharedManager] addState:state];
            
        }
        
        // 系统消息
        else if(typeInt == USER_MANAGER_SYSTEM){

            
            
            AFHeadState *state = [[AFHeadState alloc] init];
            state.modelID = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixSystem,[modelUserInfo.userInfoID intValue]];
            state.enabled = YES;
            state.isSelectedMode = NO;
            state.canModifyselected = YES;
            state.selected = -1;
            state.showDelete = NO;
            
            [[AFHeadStateManager sharedManager] addState:state];
        }
    }
}

- (void)fillFilterState:(NSArray *) groupMemberArray{  //@element: CPUIModelMessageGroupMember
    
    /*
     * 1.userInfoArray 不含系统角色，userInfoArray都保持选中，不能取消
     * 2.所有系统角色和群都过滤掉，只剩下普通朋友，密友和couple
     */
    
    /////// 好友
    for(CPUIModelUserInfo * modelUserInfo in fullFriendArray){        
        AFHeadState *state = [[AFHeadState alloc] init];
        state.modelID = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixUser,[modelUserInfo.userInfoID intValue]];
        state.enabled = YES;
        state.isSelectedMode = YES;
        state.canModifyselected = YES;
        state.selected = 0;
        state.showDelete = NO;
        
        [[AFHeadStateManager sharedManager] addState:state];
        
    }

    // 群本身的成员状态
    
    
    NSMutableArray *userInfoList = [[NSMutableArray alloc] init];
    for (CPUIModelMessageGroupMember *member in groupMemberArray) {
        
        if ((![member isHiddenMember])&&member.userInfo!=nil) {  // 去掉隐藏成员,去掉陌生人
            [userInfoList addObject:member.userInfo];  
        }
    }
    
    for (CPUIModelUserInfo *userInfo in userInfoList) {
        AFHeadState *state = [[AFHeadState alloc] init];
        state.modelID = [NSString stringWithFormat:@"%@%d",kAFHeadStatePrefixUser,[userInfo.userInfoID intValue]];
        state.enabled = YES;
        state.isSelectedMode = YES;
        state.canModifyselected = NO;  // 不能被取消选中
        state.selected = 1;
        state.showDelete = NO;
        
        [[AFHeadStateManager sharedManager] addState:state];
    }
     
    
}


-(void)fillDefaultData{
    
    [fullFriendArray removeAllObjects];
    
    [_headerArray removeAllObjects];
    [_friendArray removeAllObjects];
    [_sweetArray removeAllObjects];
    [_groupArray removeAllObjects];
    
    
    [fullFriendArray addObjectsFromArray:[CPUIModelManagement sharedInstance].friendArray];
    
    CPLogInfo(@"friends %@",fullFriendArray);
    
    ////////  组群
    for(CPUIModelMessageGroup *uiMsgGroup in [CPUIModelManagement sharedInstance].userMessageGroupList){
        if ([uiMsgGroup isMsgConverGroup]){
            [uiMsgGroup initSearchData];
            [_groupArray addObject:uiMsgGroup];

        }
    }
    
    
    /////// 好友
    for(CPUIModelUserInfo * modelUserInfo in fullFriendArray){
        int typeInt = modelUserInfo.type.integerValue;
        
        // 好友
        if(typeInt == USER_RELATION_TYPE_COMMON){
            [modelUserInfo initSearchData];
            [_friendArray addObject:modelUserInfo];
        }
        
        // 蜜友
        else if(typeInt == USER_RELATION_TYPE_CLOSED){
            [modelUserInfo initSearchData];
            [_sweetArray addObject:modelUserInfo];

        }
        
        // 小双
        else if(typeInt == USER_MANAGER_XIAOSHUANG){
            [modelUserInfo initSearchData];
            [_sweetArray addObject:modelUserInfo];
            
        }
        
        
        // 另一半
        else if(typeInt == USER_RELATION_TYPE_LOVER||typeInt == USER_RELATION_TYPE_COUPLE||typeInt == USER_RELATION_TYPE_MARRIED){
            [modelUserInfo initSearchData];
            [_headerArray addObject:modelUserInfo];
            
        }
        
        // fanxer team
        else if(typeInt == USER_MANAGER_FANXER){
            [modelUserInfo initSearchData];
            [_headerArray addObject:modelUserInfo];
            
            
        }
        
        // 系统消息
        else if(typeInt == USER_MANAGER_SYSTEM){
            [modelUserInfo initSearchData];
            [_headerArray addObject:modelUserInfo];
        }
    }
    
    
    /////////////////////////////// 排序
    
    NSArray * tempGroupArray = [_groupArray sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2){
        CPUIModelMessageGroup * msgGroup1 = (CPUIModelMessageGroup *)obj1;
        CPUIModelMessageGroup * msgGroup2 = (CPUIModelMessageGroup *)obj2;
        return [msgGroup1.searchTextQuanPinWithChar compare:msgGroup2.searchTextQuanPinWithChar];
    }];
    [_groupArray removeAllObjects];
    [_groupArray addObjectsFromArray:tempGroupArray];
    
    
    /*
     系统
     */
    NSArray * tempHeaderArray = [_headerArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        CPUIModelUserInfo *userInfor1 = (CPUIModelUserInfo *)obj1;
        CPUIModelUserInfo *userInfor2 = (CPUIModelUserInfo *)obj2;
        return [userInfor1.searchTextQuanPinWithChar compare:userInfor2.searchTextQuanPinWithChar];
    }]; 
    //_headerArray = [NSMutableArray arrayWithArray:tempHeaderArray];
    [_headerArray removeAllObjects];
    [_headerArray addObjectsFromArray:tempHeaderArray];
    /*
     蜜友
     */
    NSArray * tempSweetArray = [_sweetArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        CPUIModelUserInfo *userInfor1 = (CPUIModelUserInfo *)obj1;
        CPUIModelUserInfo *userInfor2 = (CPUIModelUserInfo *)obj2;
        return [userInfor1.searchTextQuanPinWithChar compare:userInfor2.searchTextQuanPinWithChar];
    }];
    //_sweetArray = [NSMutableArray arrayWithArray:tempSweetArray];
    [_sweetArray removeAllObjects];
    [_sweetArray addObjectsFromArray:tempSweetArray];
    /*
     好友
     */
    
    NSArray * tempFriendArray = [_friendArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        CPUIModelUserInfo *userInfor1 = (CPUIModelUserInfo *)obj1;
        CPUIModelUserInfo *userInfor2 = (CPUIModelUserInfo *)obj2;
        return [userInfor1.searchTextQuanPinWithChar compare:userInfor2.searchTextQuanPinWithChar];
    }];
    //_friendArray = [NSMutableArray arrayWithArray:tempFriendArray];
    [_friendArray removeAllObjects];
    [_friendArray addObjectsFromArray:tempFriendArray];
    
    ///////////////////////////////////////////////////////////
    
    [resultArray removeAllObjects];
    
    AFSectionData *headerData = [AFSectionData afSectionDataWith:_headerArray title:@""];
    if ([headerData.sectionData count]>0) {
        [resultArray addObject:headerData];
    }
    AFSectionData *sweetData = [AFSectionData afSectionDataWith:_sweetArray title:@"蜜友"];
    if ([sweetData.sectionData count]>0) {
        [resultArray addObject:sweetData];
    }
    AFSectionData *friendData = [AFSectionData afSectionDataWith:_friendArray title:@"好友"];
    if ([friendData.sectionData count]>0) {
        [resultArray addObject:friendData];
    }
    AFSectionData *groupData = [AFSectionData afSectionDataWith:_groupArray title:@"群组"];
    if ([groupData.sectionData count]>0) {
        [resultArray addObject:groupData];
    }

}

- (void)fillFilterData{   // 去掉系统角色和群
    
    [fullFriendArray removeAllObjects];
    
    [_headerArray removeAllObjects];
    [_friendArray removeAllObjects];
    [_sweetArray removeAllObjects];
    [_groupArray removeAllObjects];
    
    
    [fullFriendArray addObjectsFromArray:[CPUIModelManagement sharedInstance].friendArray];
    
    
    /////// 好友
    for(CPUIModelUserInfo * modelUserInfo in fullFriendArray){
        int typeInt = modelUserInfo.type.integerValue;
        
        // 好友
        if(typeInt == USER_RELATION_TYPE_COMMON){
            [modelUserInfo initSearchData];
            [_friendArray addObject:modelUserInfo];
        }
        
        // 蜜友
        else if(typeInt == USER_RELATION_TYPE_CLOSED){
            [modelUserInfo initSearchData];
            [_sweetArray addObject:modelUserInfo];

        }
        
        // 另一半
        else if(typeInt == USER_RELATION_TYPE_LOVER||typeInt == USER_RELATION_TYPE_COUPLE||typeInt == USER_RELATION_TYPE_MARRIED){
            [modelUserInfo initSearchData];
            [_headerArray addObject:modelUserInfo];
        }
    }
    
    
    /////////////////////////////// 排序
    /*
     蜜友
     */
    NSArray * tempSweetArray = [_sweetArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        CPUIModelUserInfo *userInfor1 = (CPUIModelUserInfo *)obj1;
        CPUIModelUserInfo *userInfor2 = (CPUIModelUserInfo *)obj2;
        return [userInfor1.searchTextQuanPinWithChar compare:userInfor2.searchTextQuanPinWithChar];
    }];
    //_sweetArray = [NSMutableArray arrayWithArray:tempSweetArray];
    [_sweetArray removeAllObjects];
    [_sweetArray addObjectsFromArray:tempSweetArray];
    /*
     好友
     */
    
    NSArray * tempFriendArray = [_friendArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        CPUIModelUserInfo *userInfor1 = (CPUIModelUserInfo *)obj1;
        CPUIModelUserInfo *userInfor2 = (CPUIModelUserInfo *)obj2;
        return [userInfor1.searchTextQuanPinWithChar compare:userInfor2.searchTextQuanPinWithChar];
    }];
    //_friendArray = [NSMutableArray arrayWithArray:tempFriendArray];
    [_friendArray removeAllObjects];
    [_friendArray addObjectsFromArray:tempFriendArray];
    
    ///////////////////////////////////////////////////////////
    
    [resultArray removeAllObjects];
    
    AFSectionData *headerData = [AFSectionData afSectionDataWith:_headerArray title:@""];
    if ([headerData.sectionData count]>0) {
        [resultArray addObject:headerData];
    }
    AFSectionData *sweetData = [AFSectionData afSectionDataWith:_sweetArray title:@"蜜友"];
    if ([sweetData.sectionData count]>0) {
        [resultArray addObject:sweetData];
    }
    AFSectionData *friendData = [AFSectionData afSectionDataWith:_friendArray title:@"好友"];
    if ([friendData.sectionData count]>0) {
        [resultArray addObject:friendData];
    }
}


- (void)filterLogic:(AFHeadItem *) item{

    CPLogInfo(@"filterLogic");
    
    AFHeadState *state = item.headState;

    if (state.isSelectedMode&&state.canModifyselected) {    // 当前是选人状态 + 可以被选择
        
        if ([state.modelID hasPrefix:kAFHeadStatePrefixSystem]) { // 系统角色
            CPLogInfo(@"system_");
            /*
             * 选中系统角色，只能选一个，其他都不能选
             */
            
            if (1 != state.selected) { // 被选中
                // 选中系统角色，其他都不能选
                for (NSString *key in [[AFHeadStateManager sharedManager] allKeys]) {   
                    AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:key];
                    if ([temp.modelID isEqualToString:state.modelID]) {  // 自己
                        temp.enabled = YES;
                        temp.selected = 1;
                        
                    }else {
                        temp.enabled = NO;
                        
                    }
                    [[AFHeadStateManager sharedManager] addState:temp];
                }
            }else {
                // 取消选中系统角色，所有都能选
                for (NSString *key in [[AFHeadStateManager sharedManager] allKeys]) {   
                    AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:key];
                    if ([temp.modelID isEqualToString:state.modelID]) {  // 自己
                        temp.enabled = YES;
                        temp.selected = 0;
                        
                    }else {
                        temp.enabled = YES;
                        
                    }
                    [[AFHeadStateManager sharedManager] addState:temp];
                }
            }
            [frendsTableView reloadData];
            
        }else if ([state.modelID hasPrefix:kAFHeadStatePrefixUser]) { // 普通角色
            CPLogInfo(@"user_");
            /*
             * 选中普通角色，系统角色和群都不能选
             */
            
            CPLogInfo(@"state.selected ======== %d",state.selected);
            
            if (1 != state.selected) { // 被选中
                
                
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
                
                if (([[[AFHeadStateManager sharedManager] allSelectedStates] count]+strangerCount)>=kMaxCountOfSelectedFriends){  /////////////  满员 19人
                    [[HPTopTipView shareInstance] showMessage:@"这里很热闹，已经满20人啦"];
                }else {
                    
                    CPLogInfo(@"state.modelID %@",state.modelID);
                    
                    for (NSString *key in [[AFHeadStateManager sharedManager] allKeys]) {   
                        AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:key];
                        
                        if ([temp.modelID isEqualToString:state.modelID]){   // 是自己
                            temp.enabled = YES;
                            temp.selected = 1;
                            [[AFHeadStateManager sharedManager] addState:temp];
                        } else if ([temp.modelID hasPrefix:kAFHeadStatePrefixSystem]||[temp.modelID hasPrefix:kAFHeadStatePrefixGroup]) {  // 排除系统角色和群
                            temp.enabled = NO;
                            
                        }
                        
                        [[AFHeadStateManager sharedManager] addState:temp];
                    }
                }
            }else {    
                for (NSString *key in [[AFHeadStateManager sharedManager] allKeys]) {   
                    AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:key];
                    if ([temp.modelID isEqualToString:state.modelID]){   // 是自己
                        temp.enabled = YES;
                        temp.selected = 0;
                        [[AFHeadStateManager sharedManager] addState:temp];
                        
                    }//else {
                    //   break;
                    //}
                }
                
                if ([[[AFHeadStateManager sharedManager] allSelectedStates] count]<1) {  // 全都不选中
                    for (NSString *key in [[AFHeadStateManager sharedManager] allKeys]) {   
                        AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:key];
                        temp.enabled = YES;
                        temp.selected = 0;
                        [[AFHeadStateManager sharedManager] addState:temp];
                    }
                }
            }
            [frendsTableView reloadData];
            
        }else if ([state.modelID hasPrefix:kAFHeadStatePrefixGroup]){ // 群角色
            CPLogInfo(@"group_");
            
            /*
             * 选中一个群，其他都不能选
             */
            
            if (1 != state.selected) { // 被选中
                // 选中群，其他都不能选
                for (NSString *key in [[AFHeadStateManager sharedManager] allKeys]) {   
                    AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:key];
                    if ([temp.modelID isEqualToString:state.modelID]) {  // 自己
                        temp.enabled = YES;
                        temp.selected = 1;
                        
                    }else {
                        temp.enabled = NO;
                        
                    }
                    
                    [[AFHeadStateManager sharedManager] addState:temp];
                }
            }else {
                // 取消选中群，所有都能选
                for (NSString *key in [[AFHeadStateManager sharedManager] allKeys]) {   
                    AFHeadState *temp = [[AFHeadStateManager sharedManager] stateForKey:key];
                    if ([temp.modelID isEqualToString:state.modelID]) {  // 自己
                        temp.enabled = YES;
                        temp.selected = 0;
                        
                    }else {
                        temp.enabled = YES;
                        
                    }
                    [[AFHeadStateManager sharedManager] addState:temp];
                }
            }
            [frendsTableView reloadData];
        }
    }else {    // 查看profile状态
        // TODO:
        CPLogInfo(@"goto profile!!");

        if (!state.canModifyselected) { // 选中群本身就有的人
            return;
        }
        
        if (state.showDelete) {   // 有删除按钮的时候，不进profile
            return;
        }
        
        //item.headItemData;  群或个人
        
       if ([item.headItemData isKindOfClass:[CPUIModelUserInfo class]]) {  
           
           SingleIndependentProfileViewController *singleIndependentProfile = [[SingleIndependentProfileViewController alloc] initWithUserInfo:(CPUIModelUserInfo *)item.headItemData];
           [self.navigationController pushViewController:singleIndependentProfile animated:YES];           
       }else if([item.headItemData isKindOfClass:[CPUIModelMessageGroup class]])
       {
           GroupIndependentProfileViewController *groupIndependentProfile = [[GroupIndependentProfileViewController alloc] initWithMsgGroup:(CPUIModelMessageGroup *)item.headItemData];
           [self.navigationController pushViewController:groupIndependentProfile animated:YES];
       }

        
    }
}


- (void) searchWithSearchStr:(NSString *)searchText{  
    
    [searchedHeaderArray removeAllObjects];
    [searchedFriendArray removeAllObjects];
    [searchedSweetArray removeAllObjects];
    [searchedGroupArray removeAllObjects];
    
    /*
     系统过滤
     */
    for(CPUIModelUserInfo *uiUserInfo in _headerArray)
    {
        if (uiUserInfo &&[self filterUserInfoWithString:searchText uiModel:uiUserInfo])
        {
            if([uiUserInfo.type integerValue] == USER_MANAGER_BUTTON){
            }
            [searchedHeaderArray addObject:uiUserInfo];
        }
    }
    /*
     蜜友过滤
     */
    for(CPUIModelUserInfo *uiUserInfo in _sweetArray)
    {
        if (uiUserInfo&&[self filterUserInfoWithString:searchText uiModel:uiUserInfo])
        {
            [searchedSweetArray addObject:uiUserInfo];
        }
    }
    /*
     好友过滤
     */
    for(CPUIModelUserInfo *uiUserInfo in _friendArray)
    {
        if (uiUserInfo&&[self filterUserInfoWithString:searchText uiModel:uiUserInfo])
        {
            [searchedFriendArray addObject:uiUserInfo];
        }
    }    
    /*
     群组过滤
     */
    for(CPUIModelMessageGroup  * uiMsgGroup in _groupArray){
        if (uiMsgGroup&&[self filterMsgGroupWithString:searchText uiModel:uiMsgGroup])
        {
            [searchedGroupArray addObject:uiMsgGroup];
        }
    }
    
    
    ///////////////////////////////////////////////////////////
    [resultArray removeAllObjects];
    AFSectionData *headerData = [AFSectionData afSectionDataWith:searchedHeaderArray title:@""];
    if ([headerData.sectionData count]>0) {
        [resultArray addObject:headerData];
    }
    
    AFSectionData *sweetData = [AFSectionData afSectionDataWith:searchedSweetArray title:@"蜜友"];
    if ([sweetData.sectionData count]>0) {
        [resultArray addObject:sweetData];
    }
    AFSectionData *friendData = [AFSectionData afSectionDataWith:searchedFriendArray title:@"好友"];
    if ([friendData.sectionData count]>0) {
        [resultArray addObject:friendData];
    }
    AFSectionData *groupData = [AFSectionData afSectionDataWith:searchedGroupArray title:@"群组"];
    if ([groupData.sectionData count]>0) {
        [resultArray addObject:groupData];
    }
}

-(BOOL)filterMsgGroupWithString:(NSString *)searchText uiModel:(CPUIModelMessageGroup *)msgGroup{
    BOOL isCompare = NO;
    NSUInteger k = 0;
    for (int i = 0; i < [msgGroup.searchTextPinyinArray count]; i++) 
    {
        NSRange 
        range;
        range.length = 1;
        range.location = k;
        
        NSString *text = [[searchText substringWithRange:range] uppercaseString];
        int isChinese = [text characterAtIndex:0];
        if (isChinese > 0x4e00 && isChinese < 0x9fff) 
        {
            NSString * str = [msgGroup.searchTextPinyinArray objectAtIndex:i];
            if ([str isEqualToString:text]) 
            {
                k++;
            }else 
            {
                k = 0;
            }
        }else 
        {
            NSString * str = [msgGroup.searchTextPinyinArray objectAtIndex:i];
            if ([str isEqualToString:text]) {
                k++;
            }else {
                k = 0;
            }
        }
        if (k == [searchText length]) {
            isCompare =YES;
            break;
        }
    }
    if (isCompare) 
    {
        return YES;
    }else 
    {
        NSMutableString *searchcondition = [NSMutableString stringWithCapacity:100];
        BOOL hasChinese = NO;
        for (int i = 0; i<[searchText length]; i++) 
        {
            NSRange range;
            range.length = 1;
            range.location = i;
            NSString *temp = [searchText substringWithRange:range];
            int isChinese = [temp characterAtIndex:0];
            if (isChinese > 0x4e00 && isChinese < 0x9fff) 
            {
                hasChinese = YES;
                [searchcondition appendString:[NSString stringWithFormat:@"%d",isChinese]];
            }else 
            {
                [searchcondition appendString:[temp uppercaseString]];
            }
        }
        if (hasChinese)
        {
            if ([msgGroup.searchTextQuanPinWithInt rangeOfString:searchcondition].location != NSNotFound)
            {
                return YES;
            }
        }else 
        {
            if ([msgGroup.searchTextQuanPinWithChar rangeOfString:searchcondition].location != NSNotFound) 
            {
                return YES;
            }
        }
    }
    return NO;
}




-(BOOL)filterUserInfoWithString:(NSString *)searchText uiModel:(CPUIModelUserInfo *)uiUserInfo
{    
    BOOL isCompare = NO;
    NSUInteger k = 0;
    for (int i = 0; i < [uiUserInfo.searchTextPinyinArray count]; i++) 
    {
        NSRange 
        range;
        range.length = 1;
        range.location = k;
        
        NSString *text = [[searchText substringWithRange:range] uppercaseString];
        int isChinese = [text characterAtIndex:0];
        if (isChinese > 0x4e00 && isChinese < 0x9fff) 
        {
            NSString * str = [uiUserInfo.searchTextPinyinArray objectAtIndex:i];
            if ([str isEqualToString:text]) 
            {
                k++;
            }else 
            {
                k = 0;
            }
        }else 
        {
            NSString * str = [uiUserInfo.searchTextPinyinArray objectAtIndex:i];
            if ([str isEqualToString:text]) {
                k++;
            }else {
                k = 0;
            }
        }
        if (k == [searchText length]) {
            isCompare =YES;
            break;
        }
    }
    if (isCompare) 
    {
        return YES;
    }else 
    {
        NSMutableString *searchcondition = [NSMutableString stringWithCapacity:100];
        BOOL hasChinese = NO;
        for (int i = 0; i<[searchText length]; i++) 
        {
            NSRange range;
            range.length = 1;
            range.location = i;
            NSString *temp = [searchText substringWithRange:range];
            int isChinese = [temp characterAtIndex:0];
            if (isChinese > 0x4e00 && isChinese < 0x9fff) 
            {
                hasChinese = YES;
                [searchcondition appendString:[NSString stringWithFormat:@"%d",isChinese]];
            }else 
            {
                [searchcondition appendString:[temp uppercaseString]];
            }
        }
        if (hasChinese)
        {
            if ([uiUserInfo.searchTextQuanPinWithInt rangeOfString:searchcondition].location != NSNotFound)
            {
                return YES;
            }
        }else 
        {
            if ([uiUserInfo.searchTextQuanPinWithChar rangeOfString:searchcondition].location != NSNotFound) 
            {
                return YES;
            }
        }
    }
    return NO;
}


@end
