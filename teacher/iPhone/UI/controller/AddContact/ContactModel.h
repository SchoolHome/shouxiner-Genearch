//
//  ContractModel.h
//  iCouple
//
//  Created by yong wei on 12-4-2.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactModel : NSObject
// 主键
@property (strong,nonatomic) NSNumber *contactID;
// 全名
@property (strong,nonatomic) NSString *fullName;
// 搜索的文本
@property (strong,nonatomic) NSString *searchText;
// 拆分名字为单字
@property (strong,nonatomic) NSMutableArray *searchTextArray;
// 单字所对应的拼音
@property (strong,nonatomic) NSMutableArray *searchTextPinyinArray;
@property (strong,nonatomic) NSMutableString *searchTextQuanPinWithInt;
@property (strong,nonatomic) NSMutableString *searchTextQuanPinWithChar;
// 电话号码 可能是多个
@property (strong,nonatomic) NSArray *contactWayList;
// 是否选中此联系人
@property (nonatomic) BOOL isSelected;
// 此联系人的电话号码
@property (strong,nonatomic) NSString *selectedTelNumber;
@property (nonatomic) BOOL isSendedMessage;

@end
