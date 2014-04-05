//
//  SectionModel.h
//  iCouple
//
//  Created by yong wei on 12-4-5.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>

// 模式定义
typedef enum {
    UIAddFriends,               // 添加好友
    UIAddCloseFriends,          // 添加密友
    UIAddLike,                  // 添加喜欢（暗恋）
    UIAddCouple,                // 添加Couple
    UIAddCoupleOnlyMoblieNumber // 添加Couple仅仅返回电话号码
} UIAddContactView;

// 单元格的样式
typedef enum{
    EventCell,
    MultiSelectCell,
    SingleCell
}UITableViewCellType;

// 单元格的数据格式
typedef enum{
    DataContactModel,
    DataUserInforModel
}DataModel;


@interface SectionModel : NSObject
@property (strong,nonatomic) NSString *sectionName;
@property (nonatomic) UITableViewCellType tableViewCellType;
@property (strong,nonatomic) NSMutableArray *searchArray;
@property (strong,nonatomic) NSMutableDictionary *dataSourceDictionary;
@property (nonatomic) DataModel dataModel;
@end
