//
//  UserInforModel.m
//  iCouple
//
//  Created by yong wei on 12-4-2.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import "UserInforModel.h"

@interface UserInforModel ()
-(void) changestate;
@end

@implementation UserInforModel
@synthesize userInfoID = _userInfoID , nickName = _nickName , fullName = _fullName , userInforState = _userInforState , dataType = _dataType , userName = _userName , descriptionState = _descriptionState;
@synthesize searchText = _searchText , searchTextArray = _searchTextArray , searchTextPinyinArray = _searchTextPinyinArray ,
searchTextQuanPinWithChar = _searchTextQuanPinWithChar , searchTextQuanPinWithInt = _searchTextQuanPinWithInt;
@synthesize headerPath = _headerPath , coupleAccount = _coupleAccount , hasLover = _hasLover , hasCouple = _hasCouple;
@synthesize telPhoneNumber = _telPhoneNumber;
@synthesize sex = _sex , hasBaby = _hasBaby , babyfilePath = _babyfilePath;

-(id) initUserInfor{
    self = [super init];
    
    if (self) {
        self.userInforState = UserStateNormal;
        self.descriptionState = 0;
    }
    return self;
}

-(void) startTimer{
    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(changestate) userInfo:nil repeats:NO];
}

-(void) changestate{
    self.userInforState = UserStateSucceedNoText;
}
@end
