//
//  AddContractModel.m
//  iCouple
//
//  Created by yong wei on 12-3-30.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "AddContactModel.h"

@interface AddContactModel ()
/* 关于排序的属性、方法等集合 */
@property (strong,nonatomic) NSMutableArray *sortedContactKeys;
@property (strong,nonatomic) NSMutableArray *sortedFriendsKeys;
@property (strong,nonatomic) NSMutableArray *sortedCloseFriendsKeys;
@property (strong,nonatomic) NSMutableArray *sortedCoupleRecommendKeys;
@property (strong,nonatomic) NSMutableArray *sortedFriendAndCloseFriendKeys;
@property (nonatomic) UIAddContactView uiAddContactView;

-(void) configSearchData : (id) data withUIDataModel : (UIDataModel) dataModel withField : (SearchField)field;

-(void) searchData : (NSMutableDictionary *)dataSource withSearchedDataSource : (NSMutableArray *)searchedDataSource withSortedKeys : (NSMutableArray *) sortedKeys withSearchFieldType : (SearchField) searchFieldType;

-(void) sortDataSourceKeys : (NSMutableDictionary *) dataSource withSortKeys : (NSMutableArray *)sortedKeys withField : (SearchField) field withDataType : (DataModel) dataModel;
@end

@interface AddContactModel ()
// 拷贝数据源数据到本地联系人数据源
-(void) copyDataSourceToContact;
// 拷贝数据源数据到本地数据源，类型为制定的数据源
-(void) copyDataSource : (NSArray *) dataSource withLocalDataSource : (NSMutableDictionary *) localDataSource withField : (SearchField) field withTag : (CopyDataTag)  tag;

/* 函数废弃
-(void) copyDataSource : (NSArray *) dataSource1 withDataSource : (NSArray *)dataSource2 withLocalDataSource : (NSMutableDictionary *) localDataSource withField : (SearchField) field;
*/
@end

@implementation AddContactModel
@synthesize contactDictionary = _contactDictionary , coupleRecommendDictionary = _coupleRecommendDictionary , 
            friendDictionary = _friendDictionary , closedFriendDictionary = _closedFriendDictionary , friendAndCloseFriendDictionary = _friendAndCloseFriendDictionary;

@synthesize searchedContactArray = _searchedContactArray , searchedCoupleRecommendArray = _searchedCoupleRecommendArray , 
            searchedFriendArray = _searchedFriendArray , searchedClosedFriendArray = _searchedClosedFriendArray , searchedFriendAndCloseFriendArray = _searchedFriendAndCloseFriendArray;

@synthesize sortedContactKeys = _sortedContactKeys , sortedFriendsKeys = _sortedFriendsKeys , sortedCloseFriendsKeys = _sortedCloseFriendsKeys ,
            sortedCoupleRecommendKeys = _sortedCoupleRecommendKeys , sortedFriendAndCloseFriendKeys = _sortedFriendAndCloseFriendKeys;

@synthesize searchText =_searchText;
@synthesize sectionArray = _sectionArray;
@synthesize userFriendCount = _userFriendCount , userCloseFriendCount = _userCloseFriendCount;
@synthesize uiAddContactView = _uiAddContactView;

-(id) initWithData :(UIAddContactView) addContactView{
    self = [super init];
    
    if (self) {
        self.uiAddContactView = addContactView;
        self.sectionArray = [[NSMutableArray alloc] initWithCapacity:5];
        self.userFriendCount = [[CPUIModelManagement sharedInstance].friendArray count];
        self.userCloseFriendCount = 0;
//        CPLogInfo(@"****************开始密友数量：%d******************",self.userCloseFriendCount);
        for (CPUIModelUserInfo *userInfor in [CPUIModelManagement sharedInstance].friendArray) {
            if ([userInfor.type intValue] == USER_RELATION_TYPE_CLOSED) {
                self.userCloseFriendCount += 1;
            }
        }
//        CPLogInfo(@"****************结束密友数量：%d******************",self.userCloseFriendCount);
        
        //CPLogInfo(@"--------------%@-----------------",[CPUIModelManagement sharedInstance].friendCommendArray);
        
        // 初始化分段信息
        SectionModel *section;
        if (addContactView == UIAddFriends) {
            // 如果是添加好友页面
            self.coupleRecommendDictionary = [[NSMutableDictionary alloc] initWithCapacity:10];
            self.sortedCoupleRecommendKeys = [[NSMutableArray alloc] initWithCapacity:10];
            // 拷贝双双推荐数据到本地数据集
            [self copyDataSource:[CPUIModelManagement sharedInstance].friendCommendArray withLocalDataSource:self.coupleRecommendDictionary withField:SearchFullName withTag:CopyAll];
            // 刷新双双推荐数据集，并且排序
            [self sortDataSourceKeys:self.coupleRecommendDictionary withSortKeys:self.sortedCoupleRecommendKeys withField:SearchFullName withDataType:DataUserInforModel];
            self.searchedCoupleRecommendArray = [[NSMutableArray alloc] initWithCapacity:10];
            // 拷贝符合条件的key到搜索结果集
            [self refreshUserInforDataToSearchedDataSource:@"" withCopyDataSourceType:CoupleRecommend withSearchFieldType:SearchNone];
            section = [[SectionModel alloc] init];
            section.sectionName = @"  双双用户";
            section.tableViewCellType = EventCell;
            section.searchArray = self.searchedCoupleRecommendArray;
            section.dataSourceDictionary = self.coupleRecommendDictionary;
            section.dataModel = DataUserInforModel;
            [self.sectionArray addObject: section];
            
            // 拷贝联系人数据到本地
            self.contactDictionary = [[NSMutableDictionary alloc] initWithCapacity:200];
            self.sortedContactKeys = [[NSMutableArray alloc] initWithCapacity:200];
            [self copyDataSourceToContact];
            // 搜索符合条件的数据到索搜结果集
            self.searchedContactArray = [[NSMutableArray alloc] initWithCapacity:200];
            [self refreshContactDataToSearchedDataSource:@""];
            section = [[SectionModel alloc] init];
            section.sectionName = @" 邀请朋友们";
            section.tableViewCellType = MultiSelectCell;
            section.searchArray = self.searchedContactArray;
            section.dataSourceDictionary = self.contactDictionary;
            section.dataModel = DataContactModel;
            [self.sectionArray addObject: section];
            // 添加联系人观察者
//            [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"contactUpdateTag" options:0 context:@"contactUpdateTag" ];
        }else if(addContactView == UIAddCloseFriends) {
            self.friendDictionary = [[NSMutableDictionary alloc] initWithCapacity:150];
            self.sortedFriendsKeys = [[NSMutableArray alloc] initWithCapacity:150];
            [self copyDataSource:[CPUIModelManagement sharedInstance].friendArray withLocalDataSource:self.friendDictionary withField:SearchNickName withTag:CopyFriendsData];
            [self sortDataSourceKeys:self.friendDictionary withSortKeys:self.sortedFriendsKeys withField:SearchNickName withDataType:DataUserInforModel];
            self.searchedFriendArray = [[NSMutableArray alloc] initWithCapacity:150];
            [self refreshUserInforDataToSearchedDataSource:@"" withCopyDataSourceType:Friends withSearchFieldType: SearchNone];
            
            section = [[SectionModel alloc] init];
            section.sectionName = @"  好友";
            section.tableViewCellType = EventCell;
            section.searchArray = self.searchedFriendArray;
            section.dataSourceDictionary = self.friendDictionary;
            section.dataModel = DataUserInforModel;
            [self.sectionArray addObject: section];
            
            
            self.coupleRecommendDictionary = [[NSMutableDictionary alloc] initWithCapacity:10];
            self.sortedCoupleRecommendKeys = [[NSMutableArray alloc] initWithCapacity:10];
            [self copyDataSource:[CPUIModelManagement sharedInstance].friendCommendArray withLocalDataSource:self.coupleRecommendDictionary withField:SearchFullName withTag:CopyAll];
            [self sortDataSourceKeys:self.coupleRecommendDictionary withSortKeys:self.sortedCoupleRecommendKeys withField:SearchFullName withDataType:DataUserInforModel];
            self.searchedCoupleRecommendArray = [[NSMutableArray alloc] initWithCapacity:10];
            [self refreshUserInforDataToSearchedDataSource:@"" withCopyDataSourceType:CoupleRecommend withSearchFieldType:SearchNone];
            section = [[SectionModel alloc] init];
            section.sectionName = @"  双双用户";
            section.tableViewCellType = EventCell;
            section.searchArray = self.searchedCoupleRecommendArray;
            section.dataSourceDictionary = self.coupleRecommendDictionary;
            section.dataModel = DataUserInforModel;
            [self.sectionArray addObject: section];
            
            
            // 拷贝联系人数据到本地
            self.contactDictionary = [[NSMutableDictionary alloc] initWithCapacity:200];
            self.sortedContactKeys = [[NSMutableArray alloc] initWithCapacity:200];
            [self copyDataSourceToContact];
            // 搜索符合条件的数据到索搜结果集
            self.searchedContactArray = [[NSMutableArray alloc] initWithCapacity:200];
            [self refreshContactDataToSearchedDataSource:@""];
            section = [[SectionModel alloc] init];
            section.sectionName = @" 邀请朋友们";
            section.tableViewCellType = MultiSelectCell;
            section.searchArray = self.searchedContactArray;
            section.dataSourceDictionary = self.contactDictionary;
            section.dataModel = DataContactModel;
            [self.sectionArray addObject: section];
//            [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"contactUpdateTag" options:0 context:@"contactUpdateTag" ];
        }else if(addContactView == UIAddLike){
            self.friendAndCloseFriendDictionary = [[NSMutableDictionary alloc] initWithCapacity:150];
            self.sortedFriendAndCloseFriendKeys = [[NSMutableArray alloc] initWithCapacity:150];
            
            [self copyDataSource:[CPUIModelManagement sharedInstance].friendArray withLocalDataSource:self.friendAndCloseFriendDictionary withField:SearchNickName withTag:CopyFriendsAndCloseFriendsData];
            
            [self sortDataSourceKeys:self.friendAndCloseFriendDictionary withSortKeys:self.sortedFriendAndCloseFriendKeys withField:SearchFullName withDataType:DataUserInforModel];
            self.searchedFriendAndCloseFriendArray = [[NSMutableArray alloc] initWithCapacity:150];
            [self refreshUserInforDataToSearchedDataSource:@"" withCopyDataSourceType:FriendsAndCloseFriends withSearchFieldType:SearchNone];
            section = [[SectionModel alloc] init];
            section.sectionName = @"  好友";
            section.tableViewCellType = SingleCell;
            section.searchArray = self.searchedFriendAndCloseFriendArray;
            section.dataSourceDictionary = self.friendAndCloseFriendDictionary;
            section.dataModel = DataUserInforModel;
            [self.sectionArray addObject: section];
            
            
            // 拷贝联系人数据到本地
            self.contactDictionary = [[NSMutableDictionary alloc] initWithCapacity:200];
            self.sortedContactKeys = [[NSMutableArray alloc] initWithCapacity:200];
            [self copyDataSourceToContact];
            // 搜索符合条件的数据到索搜结果集
            self.searchedContactArray = [[NSMutableArray alloc] initWithCapacity:200];
            [self refreshContactDataToSearchedDataSource:@""];
            section = [[SectionModel alloc] init];
            section.sectionName = @" 邀请朋友们";
            section.tableViewCellType = SingleCell;
            section.searchArray = self.searchedContactArray;
            section.dataSourceDictionary = self.contactDictionary;
            section.dataModel = DataContactModel;
            [self.sectionArray addObject: section];
//            [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"contactUpdateTag" options:0 context:@"contactUpdateTag" ];
        }else if(addContactView == UIAddCouple){
            self.friendAndCloseFriendDictionary = [[NSMutableDictionary alloc] initWithCapacity:150];
            self.sortedFriendAndCloseFriendKeys = [[NSMutableArray alloc] initWithCapacity:150];
            [self copyDataSource:[CPUIModelManagement sharedInstance].friendArray withLocalDataSource:self.friendAndCloseFriendDictionary withField:SearchNickName withTag:CopyFriendsAndCloseFriendsData];
            [self sortDataSourceKeys:self.friendAndCloseFriendDictionary withSortKeys:self.sortedFriendAndCloseFriendKeys withField:SearchFullName withDataType:DataUserInforModel];
            self.searchedFriendAndCloseFriendArray = [[NSMutableArray alloc] initWithCapacity:150];
            [self refreshUserInforDataToSearchedDataSource:@"" withCopyDataSourceType:FriendsAndCloseFriends withSearchFieldType:SearchNone];
            section = [[SectionModel alloc] init];
            section.sectionName = @"  好友";
            section.tableViewCellType = SingleCell;
            section.searchArray = self.searchedFriendAndCloseFriendArray;
            section.dataSourceDictionary = self.friendAndCloseFriendDictionary;
            section.dataModel = DataUserInforModel;
            [self.sectionArray addObject: section];
            
            // 拷贝联系人数据到本地
            self.contactDictionary = [[NSMutableDictionary alloc] initWithCapacity:200];
            self.sortedContactKeys = [[NSMutableArray alloc] initWithCapacity:200];
            [self copyDataSourceToContact];
            // 搜索符合条件的数据到索搜结果集
            self.searchedContactArray = [[NSMutableArray alloc] initWithCapacity:200];
            [self refreshContactDataToSearchedDataSource:@""];
            section = [[SectionModel alloc] init];
            section.sectionName = @" 邀请朋友们";
            section.tableViewCellType = SingleCell;
            section.searchArray = self.searchedContactArray;
            section.dataSourceDictionary = self.contactDictionary;
            section.dataModel = DataContactModel;
            [self.sectionArray addObject: section];
//            [[CPUIModelManagement sharedInstance] addObserver:self forKeyPath:@"contactUpdateTag" options:0 context:@"contactUpdateTag" ];
        }else if (addContactView == UIAddCoupleOnlyMoblieNumber) {
            // 拷贝联系人数据到本地
            self.contactDictionary = [[NSMutableDictionary alloc] initWithCapacity:200];
            self.sortedContactKeys = [[NSMutableArray alloc] initWithCapacity:200];
            [self copyDataSourceToContact];
            // 搜索符合条件的数据到索搜结果集
            self.searchedContactArray = [[NSMutableArray alloc] initWithCapacity:200];
            [self refreshContactDataToSearchedDataSource:@""];
            section = [[SectionModel alloc] init];
            section.sectionName = @" 邀请朋友们";
            section.tableViewCellType = SingleCell;
            section.searchArray = self.searchedContactArray;
            section.dataSourceDictionary = self.contactDictionary;
            section.dataModel = DataContactModel;
            [self.sectionArray addObject: section];
        }
    }
    
    return self;
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
//    if([keyPath isEqualToString:@"contactUpdateTag"]){
//        //[self copyDataSourceToContact];
//    }
//}

// 深拷贝本地未存在的通讯录数据源到本地通讯录数据源
-(void) copyDataSourceToContact{
    
    NSArray *contactArray = nil;
    if (self.uiAddContactView == UIAddLike || self.uiAddContactView == UIAddCouple) {
        contactArray = [[CPUIModelManagement sharedInstance] getAllContactsByFriendsFilter];
    }else {
        contactArray = [[CPUIModelManagement sharedInstance] getAllContactsByFilter];
    }
    
//    contactArray = [[CPUIModelManagement sharedInstance] getAllContactsByFilter];
    
    for (NSUInteger i = 0; i< [contactArray count]; i++) {
        CPUIModelContact *sourceData = (CPUIModelContact *)[contactArray objectAtIndex:i];
        if ([self.contactDictionary objectForKey:sourceData.contactID] == nil) {
            ContactModel *contactModel = [[ContactModel alloc] init];
            // key
            contactModel.contactID = [sourceData.contactID copy];
            
            contactModel.fullName = [sourceData.fullName copy];
            [self configSearchData:contactModel withUIDataModel:ISContactMode withField:SearchFullName];
            contactModel.contactWayList = sourceData.contactWayList;
            contactModel.isSelected = NO;
            contactModel.selectedTelNumber = @"";
            contactModel.isSendedMessage = NO;
            [self.contactDictionary setObject:contactModel forKey:contactModel.contactID];
        }else {
            // 刷新缓存
//            ContactModel *contactModel = (ContactModel *)[self.contactDictionary objectForKey:sourceData.contactID];
//            if ([contactModel.fullName isEqualToString:sourceData.fullName]) {
//                continue;
//            }else {
//                contactModel.fullName = [sourceData.fullName copy];
//                [self configSearchData:contactModel withUIDataModel:ISContactMode withField:SearchFullName];
//            }
        }
    }
    [self sortDataSourceKeys:self.contactDictionary withSortKeys:self.sortedContactKeys withField:SearchFullName withDataType:DataContactModel];
}


-(void) copyDataSource : (NSArray *) dataSource withLocalDataSource : (NSMutableDictionary *) localDataSource withField : (SearchField) field withTag : (CopyDataTag) tag{
    for (NSUInteger i = 0; i<[dataSource count]; i++) {
        CPUIModelUserInfo *userInfor = (CPUIModelUserInfo *)[dataSource objectAtIndex:i];
        
        // 如果拷贝仅仅是好友数据
        if (tag == CopyFriendsData) {
            // 该数据是密友数据
            if ([userInfor.type intValue] == USER_RELATION_TYPE_CLOSED) {
                continue;
            // 该数据是couple，过滤掉
            }else if ([userInfor.type intValue] == USER_RELATION_TYPE_MARRIED || [userInfor.type intValue] == USER_RELATION_TYPE_COUPLE || [userInfor.type intValue] == USER_RELATION_TYPE_LOVER) {
                continue;
            }
        }
        
        // 如果是添加喜欢界面
        if (self.uiAddContactView == UIAddLike) {
            if (tag == CopyFriendsAndCloseFriendsData) {
                // 如果我已有couple则过滤掉此人
                if ([userInfor.type intValue] == USER_RELATION_TYPE_MARRIED || [userInfor.type intValue] == USER_RELATION_TYPE_COUPLE) {
                    continue;
                }
            }
        }
        
        // 如果是双双、系统消息、双双团队
        if ( [userInfor.type intValue] >= 100 ) {
            continue;
        }
        

        
        if ([localDataSource objectForKey:userInfor.userInfoID] == nil) {
            UserInforModel *userInforModel = [[UserInforModel alloc] init];
            // key
            userInforModel.userName = [userInfor.name copy];
            
            //warning key的测试数据为空则不记录这条数据，真实数据须不允许为空
            if (nil == userInforModel.userName || [userInforModel.userName isEqualToString:@""]) {
                continue;
            }
            userInforModel.nickName = [userInfor.nickName copy];
            userInforModel.fullName = [userInfor.fullName copy];
//            NSLog(@"%@",userInfor.nickName);
//            NSLog(@"%@",userInfor.fullName);
            userInforModel.hasCouple = [userInfor hasCouple];
            userInforModel.hasLover = [userInfor hasLover];
            userInforModel.headerPath = [userInfor.headerPath copy];
            userInforModel.telPhoneNumber = [userInfor.mobileNumber copy];
            [self configSearchData:userInforModel withUIDataModel:ISUserInforMode withField:field];
            userInforModel.userInforState = UserStateNormal;
            [localDataSource setObject:userInforModel forKey:userInforModel.userName];
        }else {
            // 刷新缓存
//            UserInforModel *localUserInforModel = (UserInforModel *)[localDataSource objectForKey:userInfor.userInfoID];
//            BOOL isChange = NO;
//            if (![localUserInforModel.fullName isEqualToString:userInfor.fullName]) {
//                isChange = YES;
//                localUserInforModel.fullName = [userInfor.fullName copy];
//            }
//            if (![localUserInforModel.nickName isEqualToString:userInfor.nickName]) {
//                isChange = YES;
//                localUserInforModel.nickName = [userInfor.nickName copy];
//            }
//            if (isChange) {
//                [self configSearchData:localUserInforModel withUIDataModel:ISContactMode withField:field];
//            }
        }
    }
}

/* 函数废弃
-(void) copyDataSource : (NSArray *) dataSource1 withDataSource:(NSArray *)dataSource2 withLocalDataSource : (NSMutableDictionary *) localDataSource withField : (SearchField) field{
    for (NSUInteger i = 0; i<[dataSource1 count]; i++) {
        CPUIModelUserInfo *userInfor = (CPUIModelUserInfo *)[dataSource1 objectAtIndex:i];
        if ([localDataSource objectForKey:userInfor.userInfoID] == nil) {
            UserInforModel *userInforModel = [[UserInforModel alloc] init];
            userInforModel.userInfoID = [userInfor.userInfoID copy];
            
            userInforModel.nickName = [userInfor.nickName copy];
            userInforModel.fullName = [userInfor.fullName copy];
            [self configSearchData:userInforModel withUIDataModel:ISUserInforMode withField:field];
            userInforModel.userInforState = UserStateNormal;
            [localDataSource setObject:userInforModel forKey:userInforModel.userInfoID];
        }else {
            // 刷新缓存
//            UserInforModel *localUserInforModel = (UserInforModel *)[localDataSource objectForKey:userInfor.userInfoID];
//            BOOL isChange = NO;
//            if (![localUserInforModel.fullName isEqualToString:userInfor.fullName]) {
//                isChange = YES;
//                localUserInforModel.fullName = [userInfor.fullName copy];
//            }
//            if (![localUserInforModel.nickName isEqualToString:userInfor.nickName]) {
//                isChange = YES;
//                localUserInforModel.nickName = [userInfor.nickName copy];
//            }
//            if (isChange) {
//                [self configSearchData:localUserInforModel withUIDataModel:ISContactMode withField:field];
//            }
        }
    }
    for (NSUInteger i = 0; i<[dataSource2 count]; i++) {
        CPUIModelUserInfo *userInfor = (CPUIModelUserInfo *)[dataSource2 objectAtIndex:i];
        if ([localDataSource objectForKey:userInfor.userInfoID] == nil) {
            UserInforModel *userInforModel = [[UserInforModel alloc] init];
            userInforModel.userInfoID = [userInfor.userInfoID copy];
            
            userInforModel.nickName = [userInfor.nickName copy];
            userInforModel.fullName = [userInfor.fullName copy];
            [self configSearchData:userInforModel withUIDataModel:ISUserInforMode withField:field];
            userInforModel.userInforState = UserStateNormal;
            [localDataSource setObject:userInforModel forKey:userInforModel.userInfoID];
        }else {
            // 刷新缓存
//            UserInforModel *localUserInforModel = (UserInforModel *)[localDataSource objectForKey:userInfor.userInfoID];
//            BOOL isChange = NO;
//            if (![localUserInforModel.fullName isEqualToString:userInfor.fullName]) {
//                isChange = YES;
//                localUserInforModel.fullName = [userInfor.fullName copy];
//            }
//            if (![localUserInforModel.nickName isEqualToString:userInfor.nickName]) {
//                isChange = YES;
//                localUserInforModel.nickName = [userInfor.nickName copy];
//            }
//            if (isChange) {
//                [self configSearchData:localUserInforModel withUIDataModel:ISContactMode withField:field];
//            }
        }
    }
}
*/

-(void) sortDataSourceKeys : (NSMutableDictionary *) dataSource withSortKeys : (NSMutableArray *)sortedKeys withField : (SearchField) field withDataType : (DataModel) dataModel{
    
    [sortedKeys removeAllObjects];
    NSArray *keys = [[dataSource allKeys] sortedArrayUsingComparator:^(id obj1, id obj2) {
        if (dataModel == DataContactModel) {
            ContactModel *contact1 = (ContactModel *)[dataSource objectForKey:obj1];
            ContactModel *contact2 = (ContactModel *)[dataSource objectForKey:obj2];
            return [contact1.searchTextQuanPinWithChar compare:contact2.searchTextQuanPinWithChar];
        }else {
            UserInforModel *userInfor1 = (UserInforModel *) [dataSource objectForKey:obj1];
            UserInforModel *userInfor2 = (UserInforModel *) [dataSource objectForKey:obj2];
            if (field == SearchFullName) {
                return [userInfor1.searchTextQuanPinWithChar compare:userInfor2.searchTextQuanPinWithChar];
            }else {
                return [userInfor1.searchTextQuanPinWithChar compare:userInfor2.searchTextQuanPinWithChar];
            }
        }
        
    }];
    [sortedKeys addObjectsFromArray:keys];
}

-(void) configSearchData:(id)data withUIDataModel : (UIDataModel) dataModel  withField : (SearchField)field{
    if (dataModel == ISContactMode) {
        ContactModel *contactModel = (ContactModel *)data;
        contactModel.searchText = contactModel.fullName;
        contactModel.searchTextArray = [[NSMutableArray alloc] initWithCapacity:5];
        contactModel.searchTextPinyinArray = [[NSMutableArray alloc] initWithCapacity:5];
        contactModel.searchTextQuanPinWithChar = [NSMutableString stringWithCapacity:100];
        contactModel.searchTextQuanPinWithInt = [NSMutableString stringWithCapacity:100];
        for (int i = 0; i < [contactModel.fullName length]; i++){
            NSRange range;
            range.length = 1;
            range.location = i;
            //[contactModel.fullNameArray addObject:[contactModel.fullName substringWithRange:range]];
            //CPLogInfo(@"%@",[contractModel.fullName substringWithRange:range]);
            //NSString *pinyin = [NSString stringWithFormat:@"%c",pinyinFirstLetter([contactModel.fullName characterAtIndex:i])];
            
            //CPLogInfo(@"%@" , pinyin);
            //[contactModel.namePinyinArray addObject:[pinyin uppercaseString]];
            
            NSString *temp = [contactModel.searchText substringWithRange:range];
            //CPLogInfo(@"%@",temp);
            int isChinese = [temp characterAtIndex:0];
            
//            CPLogInfo(@"%@",temp);
            
            if (isChinese > 0x4e00 && isChinese < 0x9fff) {
                //NSString *quanpin = [[POAPinyin Convert:temp] uppercaseString];
                //CPLogInfo(@"%@",temp);
                NSString *quanpin = [[ChineseToPinyin pinyinFromChiniseString:temp] uppercaseString];
//                CPLogInfo(@"%@",quanpin);
                //CPLogInfo(@"%@",quanpin);
                //NSString *quanpin = @"a";
                //CPLogInfo(@"%@",quanpin);
                if ( quanpin && ![quanpin isEqualToString:@""] ) {
                    [contactModel.searchTextQuanPinWithChar appendString:quanpin];
                    [contactModel.searchTextQuanPinWithInt appendString:[NSString stringWithFormat:@"%d",isChinese]];
                    [contactModel.searchTextPinyinArray addObject:[quanpin substringWithRange:NSMakeRange(0, 1)]];
                }else {
                    CPLogError(@"没有汉字：%@的拼音",temp);
                }
                
            }else {
                [contactModel.searchTextQuanPinWithChar appendString:[temp uppercaseString]];
                [contactModel.searchTextQuanPinWithInt appendString:[temp uppercaseString]];
                if (i == 0 && ![temp isEqualToString:@" "]) {
                    [contactModel.searchTextPinyinArray addObject:[temp uppercaseString]];
                }else if (i > 0 && ![temp isEqualToString:@" "]) {
                    NSString *perchar = [contactModel.fullName substringWithRange:NSMakeRange(i-1, 1)];
                    int isChinese2 = [perchar characterAtIndex:0];
                    if ( (isChinese2 > 0x4e00 && isChinese2 <0x9fff) || [perchar isEqualToString:@" "]) {
                        [contactModel.searchTextPinyinArray addObject:[temp uppercaseString]];
                    }
                }
            }
        }
    }else {
        UserInforModel *userInforModel = (UserInforModel *)data;
        if (field == SearchFullName) {
            userInforModel.searchText = userInforModel.fullName;
        }else {
            userInforModel.searchText = userInforModel.nickName;
        }
        userInforModel.searchTextArray = [[NSMutableArray alloc] initWithCapacity:5];
        userInforModel.searchTextPinyinArray = [[NSMutableArray alloc] initWithCapacity:5];
        userInforModel.searchTextQuanPinWithChar = [NSMutableString stringWithCapacity:100];
        userInforModel.searchTextQuanPinWithInt = [NSMutableString stringWithCapacity:100];
        for (int i = 0; i < [userInforModel.searchText length]; i++){
//            NSLog(@"%@",userInforModel.searchText);
//            NSLog(@"%@",userInforModel.fullName);
            NSRange range;
            range.length = 1;
            range.location = i;
            
            NSString *temp = [userInforModel.searchText substringWithRange:range];
            int isChinese = [temp characterAtIndex:0];
            if (isChinese > 0x4e00 && isChinese < 0x9fff) {
                NSString *quanpin = [[ChineseToPinyin pinyinFromChiniseString:temp] uppercaseString];

                if ( quanpin && ![quanpin isEqualToString:@""] ) {
                    [userInforModel.searchTextQuanPinWithChar appendString:quanpin];
                    [userInforModel.searchTextQuanPinWithInt appendString:[NSString stringWithFormat:@"%d",isChinese]];
                    [userInforModel.searchTextPinyinArray addObject:[quanpin substringWithRange:NSMakeRange(0, 1)]];
                }else {
                    CPLogError(@"没有汉字：%@的拼音",temp);
                }
            }else {
                [userInforModel.searchTextQuanPinWithChar appendString:[temp uppercaseString]];
                [userInforModel.searchTextQuanPinWithInt appendString:[temp uppercaseString]];
                if (i == 0 && ![temp isEqualToString:@" "]) {
                    [userInforModel.searchTextPinyinArray addObject:[temp uppercaseString]];
                }else if (i > 0 && ![temp isEqualToString:@" "]) {
//                    NSLog(@"%d",[userInforModel.fullName length]);
                    if ([userInforModel.fullName length] < i) {
                        continue;
                    }
                    NSString *perchar = [userInforModel.fullName substringWithRange:NSMakeRange(i-1, 1)];
                    int isChinese2 = [perchar characterAtIndex:0];
                    if ( (isChinese2 > 0x4e00 && isChinese2 <0x9fff) || [perchar isEqualToString:@" "]) {
                        [userInforModel.searchTextPinyinArray addObject:[temp uppercaseString]];
                    }
                }
            }
        }
        //CPLogInfo(@"search name : %@" , userInforModel.searchText);
        //CPLogInfo(@"search char : %@" , userInforModel.searchTextQuanPinWithChar);
        //CPLogInfo(@"search char : %@" , userInforModel.searchTextQuanPinWithInt);
    }
}

-(void) refreshContactDataToSearchedDataSource:(NSString *)searchString{
    self.searchText = searchString;
    if (nil == self.searchText || [self.searchText isEqualToString:@""]) {
        [self.searchedContactArray removeAllObjects];
        //NSArray *keys = [self.contactDictionary allKeys];
        //CPLogInfo(@"keys count : %d" , [self.sortedContactKeys count]);
        for (id key in self.sortedContactKeys) {
            [self.searchedContactArray addObject:key];
        }
    }else {
        [self.searchedContactArray removeAllObjects];
        //NSArray *keys = [self.contactDictionary allKeys];
        for (id key in self.sortedContactKeys) {
            BOOL isCompare = NO;
            ContactModel *contact = (ContactModel *)[self.contactDictionary objectForKey:key];
            
            NSUInteger k = 0;
            for (int i = 0; i < [contact.searchTextPinyinArray count]; i++) {
                NSRange range;
                range.length = 1;
                range.location = k;
                
                NSString *text = [[self.searchText substringWithRange:range] uppercaseString];
                int isChinese = [text characterAtIndex:0];
                if (isChinese > 0x4e00 && isChinese < 0x9fff) {
                    NSString * str = [contact.searchTextPinyinArray objectAtIndex:i];
                    if ([str isEqualToString:text]) {
                        k++;
                    }else {
                        k = 0;
                    }
                }else {
                    NSString * str = [contact.searchTextPinyinArray objectAtIndex:i];
                    if ([str isEqualToString:text]) {
                        k++;
                    }else {
                        k = 0;
                    }
                }
                if (k == [searchString length]) {
                    isCompare =YES;
                    break;
                }
            }
            if (isCompare) {
                [self.searchedContactArray addObject:key];
            }else {
                NSMutableString *searchcondition = [NSMutableString stringWithCapacity:100];
                BOOL hasChinese = NO;
                for (int i = 0; i<[self.searchText length]; i++) {
                    NSRange range;
                    range.length = 1;
                    range.location = i;
                    NSString *temp = [self.searchText substringWithRange:range];
                    int isChinese = [temp characterAtIndex:0];
                    if (isChinese > 0x4e00 && isChinese < 0x9fff) {
                        hasChinese = YES;
                        [searchcondition appendString:[NSString stringWithFormat:@"%d",isChinese]];
                    }else {
                        [searchcondition appendString:[temp uppercaseString]];
                    }
                }
                if (hasChinese) {
                    if ([contact.searchTextQuanPinWithInt rangeOfString:searchcondition].location != NSNotFound) {
                        [self.searchedContactArray addObject:key];
                    }
                }else {
                    if ([contact.searchTextQuanPinWithChar rangeOfString:searchcondition].location != NSNotFound) {
                        [self.searchedContactArray addObject:key];
                    }
                }
            }
        }
            
            /*第一版搜索，移出
            for (int i = 0; i<[self.searchText length]; i++) {
                if (i >= [contact.fullNameArray count]) {
                    isCompare = NO;
                    break;
                }
                NSRange range;
                range.length = 1;
                range.location = i;
                NSString *text = [[self.searchText substringWithRange:range] uppercaseString];
                int isChinese = [text characterAtIndex:0];
                if (isChinese > 0x4e00 && isChinese < 0x9fff) {
                    NSString * str = [contact.fullNameArray objectAtIndex:i];
                    //CPLogInfo(@"%@",str);
                    //CPLogInfo(@"%@",text);
                    if ([str isEqualToString:text]) {
                        continue;
                    }else {
                        isCompare = NO;
                        break;
                    }
                }else {
                    NSString * str = [contact.namePinyinArray objectAtIndex:i];
                    if ([str isEqualToString:text]) {
                        continue;
                    }else {
                        isCompare = NO;
                        break;
                    }
                }
            }
            
            if (isCompare) {
                //CPLogInfo(@"-----------%d",[key intValue]);
                [self.searchedContactArray addObject:key];
            }else {
                NSMutableString *searchStr = [NSMutableString stringWithCapacity:100];
                for (int i = 0; i<[self.searchText length]; i++) {
                    NSRange range;
                    range.length = 1;
                    range.location = i;
                    NSString *temp = [self.searchText substringWithRange:range];
                    int isChinese = [temp characterAtIndex:0];
                    if (isChinese > 0x4e00 && isChinese < 0x9fff) {
                        [searchStr appendString: [[ChineseToPinyin pinyinFromChiniseString:temp] uppercaseString]];
                    }else {
                        [searchStr appendString:[temp uppercaseString]];
                    }
                }
                if ([contact.nameQuanPin rangeOfString:searchStr].location != NSNotFound) {
                    [self.searchedContactArray addObject:key];
                }
            }
        }
        */
        /* 跨字符索搜 -- 暂时移出
        [self.searchedContactArray removeAllObjects];
        
        for (id key in self.sortedContactKeys) {
            // 是否匹配索搜字符
            BOOL isCompare = YES;
            BOOL isSubTextCompare = NO;
            NSUInteger k = 0;
            ContactModel *contact = (ContactModel *)[self.contactDictionary objectForKey:key];
            CPLogInfo(@"%@",contact.fullName);
            for (int i = 0; i<[self.searchText length]; i++) {
                if (i >= [contact.fullNameArray count]) {
                    isCompare = NO;
                    break;
                }
                isSubTextCompare = NO;
                NSRange range;
                range.length = 1;
                range.location = i;
                NSString *text = [[self.searchText substringWithRange:range] uppercaseString];
                int isChinese = [text characterAtIndex:0];
                
                if (isChinese > 0x4e00 && isChinese < 0x9fff) {
                    for (int j = k; j<[contact.fullNameArray count]; j++) {
                        NSString *str = [contact.fullNameArray objectAtIndex:j];
                        if ([str isEqualToString:text]) {
                            k = j;
                            isSubTextCompare = YES;
                            break;
                        }else {
                            k = j;
                            isSubTextCompare = NO;
                            continue;
                        }
                    }
                }else {
                    for (int j = k; j<[contact.namePinyinArray count]; j++) {
                        NSString * str = [contact.namePinyinArray objectAtIndex:j];
                        if ([str isEqualToString:text]) {
                            k = j;
                            isSubTextCompare = YES;
                            break;
                        }else {
                            k = j;
                            isSubTextCompare = NO;
                            continue;
                        }
                    }
                }
                
                if ( ( k + 1 ) <= [contact.fullNameArray count] && (i + 1) == [self.searchText length] && isSubTextCompare) {
                    isCompare = YES;
                    break;
                }else if (( k + 1 ) == [contact.fullNameArray count] && !isSubTextCompare) {
                    isCompare = NO;
                    break;
                }
            }
            
            if (isCompare) {
                [self.searchedContactArray addObject:key];
            }
        }
         */
    }
}

-(void) refreshUserInforDataToSearchedDataSource : (NSString *)searchString withCopyDataSourceType : (CopyDataSourceType) dataSourceType withSearchFieldType:(SearchField)searchField{
    
    self.searchText = searchString;
    // 如果索搜文本为空，则无条件导入数据到搜索结果数据集
    if (nil == self.searchText || [self.searchText isEqualToString:@""]) {
        if (dataSourceType == Friends) {
            // 如果结果集类型是好友类型，无条件导入好友类型数据
            [self.searchedFriendArray removeAllObjects];
            //NSArray *keys = [self.friendDictionary allKeys];
            for (id key in self.sortedFriendsKeys) {
                [self.searchedFriendArray addObject:key];
            }
        }else if (dataSourceType == ClosedFriends) {
            // 如果结果集类型是密友类型，无条件导入密友类型数据
            [self.searchedClosedFriendArray removeAllObjects];
            //NSArray *keys =[self.closedFriendDictionary allKeys];
            for (id key in self.sortedCloseFriendsKeys) {
                [self.searchedClosedFriendArray addObject:key];
            }
        }else if (dataSourceType == CoupleRecommend) {
            // 如果结果集类型是双双推荐类型，无条件导入双双推荐类型数据
            [self.searchedCoupleRecommendArray removeAllObjects];
            //NSArray *keys = [self.coupleRecommendDictionary allKeys];
            for (id key in self.sortedCoupleRecommendKeys) {
                [self.searchedCoupleRecommendArray addObject:key];
            }
        }else if (dataSourceType == FriendsAndCloseFriends) {
            // 如果结果集类型是朋友（好友＋密友）类型，无条件导入朋友（好友＋密友）类型数据
            [self.searchedFriendAndCloseFriendArray removeAllObjects];
            //NSArray *keys = [self.friendAndCloseFriendDictionary allKeys];
            for (id key in self.sortedFriendAndCloseFriendKeys) {
                [self.searchedFriendAndCloseFriendArray addObject:key];
            }
        }
    }else {
        if (dataSourceType == Friends) {
            [self searchData:self.friendDictionary withSearchedDataSource:self.searchedFriendArray withSortedKeys:self.sortedFriendsKeys withSearchFieldType:searchField];
        }else if (dataSourceType == ClosedFriends) {
            [self searchData:self.closedFriendDictionary withSearchedDataSource:self.searchedClosedFriendArray withSortedKeys:self.sortedCloseFriendsKeys withSearchFieldType:searchField];
        }else if (dataSourceType == CoupleRecommend) {
            [self searchData:self.coupleRecommendDictionary withSearchedDataSource:self.searchedCoupleRecommendArray withSortedKeys:self.sortedCoupleRecommendKeys withSearchFieldType:searchField];
        }else if (dataSourceType == FriendsAndCloseFriends) {
            [self searchData:self.friendAndCloseFriendDictionary withSearchedDataSource:self.searchedFriendAndCloseFriendArray withSortedKeys:self.sortedFriendAndCloseFriendKeys withSearchFieldType:searchField];
        }
    }
}

-(void) searchData:(NSMutableDictionary *)dataSource withSearchedDataSource:(NSMutableArray *)searchedDataSource withSortedKeys : (NSMutableArray *) sortedKeys withSearchFieldType:(SearchField)searchFieldType{
    
    [searchedDataSource removeAllObjects];
    for (id key in sortedKeys) {
        BOOL isCompare = NO;
        UserInforModel *userInfor = (UserInforModel *)[dataSource objectForKey:key];
        
        NSUInteger k = 0;
        for (int i = 0; i < [userInfor.searchTextPinyinArray count]; i++) {
            NSRange range;
            range.length = 1;
            range.location = k;
            
            NSString *text = [[self.searchText substringWithRange:range] uppercaseString];
            int isChinese = [text characterAtIndex:0];
            if (isChinese > 0x4e00 && isChinese < 0x9fff) {
                NSString * str = [userInfor.searchTextPinyinArray objectAtIndex:i];
                if ([str isEqualToString:text]) {
                    k++;
                }else {
                    k = 0;
                }
            }else {
                NSString * str = [userInfor.searchTextPinyinArray objectAtIndex:i];
                if ([str isEqualToString:text]) {
                    k++;
                }else {
                    k = 0;
                }
            }
            if (k == [self.searchText length]) {
                isCompare =YES;
                break;
            }
        }
        if (isCompare) {
            [searchedDataSource addObject:key];
        }else {
            NSMutableString *searchcondition = [NSMutableString stringWithCapacity:100];
            BOOL hasChinese = NO;
            for (int i = 0; i<[self.searchText length]; i++) {
                NSRange range;
                range.length = 1;
                range.location = i;
                NSString *temp = [self.searchText substringWithRange:range];
                int isChinese = [temp characterAtIndex:0];
                if (isChinese > 0x4e00 && isChinese < 0x9fff) {
                    hasChinese = YES;
                    [searchcondition appendString:[NSString stringWithFormat:@"%d",isChinese]];
                }else {
                    [searchcondition appendString:[temp uppercaseString]];
                }
            }
            if (hasChinese) {
                if ([userInfor.searchTextQuanPinWithInt rangeOfString:searchcondition].location != NSNotFound) {
                    [searchedDataSource addObject:key];
                }
            }else {
                if ([userInfor.searchTextQuanPinWithChar rangeOfString:searchcondition].location != NSNotFound) {
                    [searchedDataSource addObject:key];
                }
            }
        }
    }

    //NSArray *keys = [dataSource allKeys];
    /*
    for (id key in sortedKeys) {
        BOOL isCompare = YES;
        UserInforModel *userInfor = (UserInforModel *)[dataSource objectForKey:key];
        for (int i = 0; i<[self.searchText length]; i++) {
            if (searchFieldType == SearchFullName) {
                if (i >= [userInfor.fullNameArray count]) {
                    isCompare = NO;
                    break;
                }
            }else {
                if (i >= [userInfor.nickNameArray count]) {
                    isCompare = NO;
                    break;
                }
            }
            
            NSRange range;
            range.length = 1;
            range.location = i;
            NSString *text = [[self.searchText substringWithRange:range] uppercaseString];
            int isChinese = [text characterAtIndex:0];
            if (isChinese > 0x4e00 && isChinese < 0x9fff) {
                if (searchFieldType == SearchFullName) {
                    NSString * str = [userInfor.fullNameArray objectAtIndex:i];
                    //CPLogInfo(@"%@",str);
                    //CPLogInfo(@"%@",text);
                    if ([str isEqualToString:text]) {
                        continue;
                    }else {
                        isCompare = NO;
                        break;
                    }
                }else {
                    NSString * str = [userInfor.nickNameArray objectAtIndex:i];
                    //CPLogInfo(@"%@",str);
                    //CPLogInfo(@"%@",text);
                    if ([str isEqualToString:text]) {
                        continue;
                    }else {
                        isCompare = NO;
                        break;
                    }
                }
            }else {
                if (searchFieldType == SearchFullName) {
                    NSString * str = [userInfor.namePinyinArray objectAtIndex:i];
                    if ([str isEqualToString:text]) {
                        continue;
                    }else {
                        isCompare = NO;
                        break;
                    }
                }else {
                    NSString * str = [userInfor.nickNamePinyinArray objectAtIndex:i];
                    //CPLogInfo(@"%@",str);
                    //CPLogInfo(@"%@",text);
                    if ([str isEqualToString:text]) {
                        continue;
                    }else {
                        isCompare = NO;
                        break;
                    }
                }
            }
        }
        
        if (isCompare) {
            //CPLogInfo(@"-----------%d",[key intValue]);
            [searchedDataSource addObject:key];
        }else {
            NSMutableString *searchStr = [NSMutableString stringWithCapacity:100];
            for (int i = 0; i<[self.searchText length]; i++) {
                NSRange range;
                range.length = 1;
                range.location = i;
                NSString *temp = [self.searchText substringWithRange:range];
                int isChinese = [temp characterAtIndex:0];
                if (isChinese > 0x4e00 && isChinese < 0x9fff) {
                    [searchStr appendString: [[ChineseToPinyin pinyinFromChiniseString:temp] uppercaseString]];
                }else {
                    [searchStr appendString:[temp uppercaseString]];
                }
            }
            if (searchFieldType == SearchFullName) {
                if ([userInfor.nameQuanPin rangeOfString:searchStr].location != NSNotFound) {
                    [searchedDataSource addObject:key];
                }
            }else {
                if ([userInfor.nickQuanPin rangeOfString:searchStr].location != NSNotFound) {
                    [searchedDataSource addObject:key];
                }
            }
        }
    }
    */
}

// 获取用户好友数量 (好友＋密友＋喜欢或couple)
-(NSInteger) getUserFriendCount{
    NSInteger count = [self.friendAndCloseFriendDictionary count];
    return  count;
}

// 获取联系人列表数量
-(NSInteger) getContractDataCount{
    NSInteger count = [self.searchedContactArray count];
    return count;
}
// 获取好友用户数量
-(NSInteger) getFriendsDataCount{
    NSInteger count = [self.searchedFriendArray count];
    return count;
}

// 获得密友用户数量
-(NSInteger) GetFriendsCloseDataCount{
    NSInteger count = [self.searchedClosedFriendArray count];
    return count;
}

// 获取双双推荐数量
-(NSInteger) getCoupleRecommendDataCount{
    NSInteger count = [self.searchedCoupleRecommendArray count];
    return count;
}

-(NSUInteger) getInvitedContactCount{
    NSUInteger result = 0;
    NSArray *keys = [self.contactDictionary allKeys];
    for (id key in keys) {
        ContactModel *contact = (ContactModel *)[self.contactDictionary objectForKey:key];
        if (contact.isSelected && contact.isSendedMessage == NO) {
            result++;
        }
    }
    return result;
}

@end
