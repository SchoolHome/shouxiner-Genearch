//
//  AddContractCellBase.h
//  iCouple
//
//  Created by yong wei on 12-3-30.
//  Copyright (c) 2012年 fanxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionModel.h"

@interface AddContactCellBase : UITableViewCell
@property (strong,nonatomic) UIButton *userImageButton;
@property (strong,nonatomic) UILabel *nameLabel;
@property (strong,nonatomic) UILabel *nickName;


// section name
@property (strong,nonatomic) NSString *saveSectionName;
// 是否是联系人数据
@property (nonatomic) BOOL isContactData;
// 保存用户数据的key
@property (strong,nonatomic) NSString *userName;
// 保存联系人数据主键
@property (strong,nonatomic) NSNumber *contactID;


// 字体设置
@property (strong,nonatomic) UIFont *nameFont;
@property (strong,nonatomic) UIFont *nickNameFont;

@property (strong,nonatomic) SectionModel* sectionModel;

- (UIColor *) colorWithHexString: (NSString *) stringToConvert;

@end
