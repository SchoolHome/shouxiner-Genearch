//
//  AddContractModel.h
//  iCouple
//
//  Created by yong wei on 12-3-30.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPUIModelManagement.h"
#import "CPUIModelContact.h"
#import "CPUIModelContactWay.h"
#import "CPUIModelUserInfo.h"

#import "ContactModel.h"
#import "UserInforModel.h"
#import "pinyin.h"
#import "SectionModel.h"
#import "ChineseToPinyin.h"

typedef enum{
    Contact,
    Friends,
    ClosedFriends,
    CoupleRecommend,
    FriendsAndCloseFriends
} CopyDataSourceType;

typedef enum{
    ISContactMode,
    ISUserInforMode
}UIDataModel;

// 索搜字段
typedef enum{
    SearchFullName,
    SearchNickName,
    SearchNone
}SearchField;

// 拆分friendArray数据源
typedef enum{
    CopyFriendsData,
    CopyFriendsAndCloseFriendsData,
    CopyAll
}CopyDataTag;

@interface AddContactModel : NSObject
// 本地联系人
@property (strong,nonatomic) NSMutableDictionary *contactDictionary;
// 双双推荐
@property (strong,nonatomic) NSMutableDictionary *coupleRecommendDictionary;
// 好友列表
@property (strong,nonatomic) NSMutableDictionary *friendDictionary;
// 密友列表
@property (strong,nonatomic) NSMutableDictionary *closedFriendDictionary;
// 好友和密友列表
@property (strong,nonatomic) NSMutableDictionary *friendAndCloseFriendDictionary;

// 联系人数据源
@property (strong,nonatomic) NSMutableArray *searchedContactArray;
// 双双推荐数据源
@property (strong,nonatomic) NSMutableArray *searchedCoupleRecommendArray;
// 好友列表数据源
@property (strong,nonatomic) NSMutableArray *searchedFriendArray;
// 密友列表数据源
@property (strong,nonatomic) NSMutableArray *searchedClosedFriendArray;
// 好友和密友列表
@property (strong,nonatomic) NSMutableArray *searchedFriendAndCloseFriendArray;
// 需要搜索的文本信息
@property (strong,nonatomic) NSString *searchText;
// 分段信息数组
@property (strong,nonatomic) NSMutableArray *sectionArray;
// 获取用户好友数量 (好友＋密友＋喜欢或couple)
@property (nonatomic) NSInteger userFriendCount; 
// 获取用户密友数量 (密友)
@property (nonatomic) NSInteger userCloseFriendCount; 

// 初始化数据，深拷贝数据源数据到本地数据源
-(id) initWithData : (UIAddContactView) addContactView;

// 当检索数据源时，刷新数据源数据到检索数据源
-(void) refreshContactDataToSearchedDataSource : (NSString *)searchString;
-(void) refreshUserInforDataToSearchedDataSource : (NSString *)searchString withCopyDataSourceType : (CopyDataSourceType) dataSourceType withSearchFieldType : (SearchField) searchField;

// 获取联系人列表数量
-(NSInteger) getContractDataCount;
// 获取好友用户数量
-(NSInteger) getFriendsDataCount;
// 获得密友用户数量
-(NSInteger) GetFriendsCloseDataCount;
// 获取双双推荐数量
-(NSInteger) getCoupleRecommendDataCount;
// 获得已被邀请的联系人数量
-(NSUInteger) getInvitedContactCount;
@end
