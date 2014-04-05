//
//  ContactsModel.h
//  teacher
//
//  Created by ZhangQing on 14-3-17.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactsModel : NSObject
//key
@property (nonatomic , strong) NSString *modelKey;
//avatar
@property (nonatomic , strong) NSString *avatarPath;
//groups
//jid
@property (nonatomic , strong) NSString *jid;
//mobile
@property (nonatomic , strong) NSString *mobile;
//uid
@property (nonatomic , strong) NSString *uid;
//username
@property (nonatomic , strong) NSString *userName;
//selected
@property (nonatomic , assign) BOOL isSelected;
@end
