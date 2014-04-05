//
//  ContractModel.m
//  iCouple
//
//  Created by yong wei on 12-4-2.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "ContactModel.h"

@implementation ContactModel
@synthesize contactID = _contactID , fullName = _fullName , contactWayList = _contactWayList;
@synthesize isSelected = _isSelected , selectedTelNumber = _selectedTelNumber , isSendedMessage = _isSendedMessage;

@synthesize searchText = _searchText , searchTextArray = _searchTextArray , searchTextPinyinArray = _searchTextPinyinArray ,
searchTextQuanPinWithChar = _searchTextQuanPinWithChar , searchTextQuanPinWithInt = _searchTextQuanPinWithInt;
@end
